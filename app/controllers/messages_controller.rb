class MessagesController < ApplicationController


  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.create(message_params)
    ActionCable.server.broadcast 'room_channel', message: @message.template
  end

  private

  def message_params
    params.require(:message).permit(:content, :avatar).merge(user_id: current_user.id)
  end
end
