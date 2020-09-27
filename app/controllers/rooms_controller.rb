class RoomsController < ApplicationController
  before_action :authenticate_user!, expect: :index

  def index
    @room = Room.new
    @rooms = Room.all.order(id: 'desc')
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
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user).order(:id).last(100)
    @message = current_user.messages.build
  end

  def show_additionally
    @room = Room.find(params[:id])
    last_id = params[:oldest_message_id].to_i - 1
    @messages = @room.messages.includes(:user).order(:id).where(id: 1..last_id).last(50)
  end

  def destroy
    
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end

end
