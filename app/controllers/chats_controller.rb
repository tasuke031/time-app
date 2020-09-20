class ChatsController < ApplicationController
  
  def index
    @rooms = Room.all
    @room = Room.find(params[:room_id])
    @chat = Chat.new
    @chats = @room.chats.includes(:room).order(id: "DESC")
    if (@room.created_at < Time.now - (1.hours))
      Room.destroy_by("created_at < ?", Time.now - (1.minutes))
      redirect_to root_path
    end
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
