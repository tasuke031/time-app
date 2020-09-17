class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.references :room, null: false, foreign_key: true
      t.string :nickname, null: false
      t.text :message
      t.string :image
      t.timestamps
    end
  end
end
