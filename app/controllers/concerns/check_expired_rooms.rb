module CheckExpiredRooms
  extend ActiveSupport::Concern

  def check_expired_room
    expired_rooms = Room.where("created_at < ?", Time.now - (24.hours))
    if expired_rooms.present?
      expired_rooms.destroy_all
      redirect_to root_path, notice: "Room's over!!"
    end
  end
end