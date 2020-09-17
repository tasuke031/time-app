class ChatsController < ApplicationController
  
  def index
    @room = Room.find(params[:room_id])
    @rooms = Room.all
    @chat = Chat.new
    @chats = @room.chats.includes(:room)
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to room_chats_path
    else
      render :index
    end
  end
  
  private

  def chat_params
    params.require(:chat).permit(:nickname, :message, :image).merge(room_id: params[:room_id])
  end

end
