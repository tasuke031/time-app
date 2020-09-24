json.array! @new_chats do |chat|
  json.room_id chat.room_id
  json.nickname chat.nickname
  json.message chat.message
  json.image chat.image.url
  json.created_at chat.created_at
  json.id chat.id
end