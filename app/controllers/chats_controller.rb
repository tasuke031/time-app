class ChatsController < ApplicationController
  
  def index
    @room = Room.find(params[:room_id])
    @rooms = Room.all
    @chat = Chat.new
    @chats = @room.chats.includes(:room).order(id: "DESC")
  end

  def create
    @chat = Chat.create(chat_params)

    render json:{ chat: @chat }

  end
  
  private

  def chat_params
    # params.require(:chat).permit(nickname: params[:nickname], message: params[:message], image: params[:image] ).merge(room_id: params[:room_id])
    params.require(:chat).permit(:nickname, :message, :image).merge(room_id: params[:room_id])
  end

end
