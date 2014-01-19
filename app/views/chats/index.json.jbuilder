json.array!(@chats) do |chat|
  json.extract! chat, :id, :title, :url, :category_id
  json.url chat_url(chat, format: :json)
end
