class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    if @rooms.find_by("created_at < ?", Time.now - (1.minutes))
      Room.destroy_by("created_at < ?", Time.now - (1.minutes))
      redirect_to root_path
    end
  end
  
  def new
    @room = Room.new
  end
  
  def create
    room = Room.new(room_params)
    if room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    if room.destroy
      redirect_to root_path, notice: "削除に成功しました"
    else
      render :index, alert: "削除に失敗しました"

      @room = Room.find(params[:room_id])
      @rooms = Room.all
      @chat = Chat.new
      @chats = @room.chats.includes(:room).order(id: "DESC")
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
