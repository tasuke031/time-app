class AddChosenTimeToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :chosen_time, :integer
  end
end
