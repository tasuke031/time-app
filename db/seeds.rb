user_count = 3
room_count = 2
message_count = 500

ApplicationRecord.transaction do
  user_count.times do |n|
    User.find_or_create_by(name: "user#{n + 1}", email: "test#{n + 1}@example.com") do |user|
      user.password = 'password'
    end
  end

  room_count.times do |n|
    Room.find_or_create_by(name: "room#{n + 1}")
  end

  Message.destroy_all
  user_ids = User.ids
  room_ids = Room.ids
  message_list = []
  message_count.times do |n|
    user_id = user_ids.sample
    room_id = room_ids.sample
    line_count = rand(1..4)
    content = Faker::Lorem.paragraphs(number: line_count).join("\n")
    message_list << { user_id: user_id, room_id: room_id, content: content }
  end
  Message.create!(message_list)
end
puts '初期データの追加が完了しました'