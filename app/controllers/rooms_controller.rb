class RoomsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @room = Room.new
    @rooms = Room.all.order(id: 'desc')
    @time_upped_rooms = Room.where("created_at < ?", Time.now - (24.hours))
    if @time_upped_rooms.present?
      @time_upped_rooms.destroy_all
      redirect_to root_path, notice: "Rooms timed up!!"
    end
  end

  def create
    unless user_signed_in?
      redirect_to new_session_path
    end

    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    end
  end

  def show
    begin
      @room = Room.find(params[:id])
      @messages = @room.messages.includes(:user).order(:id).last(100)
      @message = current_user.messages.build
    rescue# => exception
      redirect_to root_path, notice: 'Rooms timed up!!'
    end
  end

  def show_additionally
    last_id = params[:oldest_message_id].to_i - 1
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user).order(id: 'desc').where(id:1..last_id).last(50)
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end

end
