class AddAvatarToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :avatar, :string
  end
end
