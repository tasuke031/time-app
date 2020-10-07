module RoomsChecker
  extend ActiveSupport::Concern
  # rooms#indexで24時間経過したルームを削除します
  def check_expired_room
    expired_rooms = Room.where("created_at < ?", Time.now - 24.hours)
    if expired_rooms.present?
      expired_rooms.destroy_all
      redirect_to root_path, notice: "Room's over!!"
    end
  end
  # rooms#showでテスト,時間切れのルームを削除します
  def check_test_or_expired_room(room)
    if room.chosen_time == 0
      if room.created_at < (Time.now - 30.seconds)
        room.destroy
        redirect_to root_path, notice: "Room's over!!"
      end
    elsif room.created_at < (Time.now - room.chosen_time.hours)
      room.destroy
      redirect_to root_path, notice: "Room's over!!"
    end
  end
end