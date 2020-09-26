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
    @messages = @room.messages.includes(:user)
    @message = current_user.messages.build
  end

  def destroy
    
  end

  private

  def room_params
    params.require(:room).permit(:name,)
  end

end
