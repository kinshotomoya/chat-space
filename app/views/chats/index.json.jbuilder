json.chats @chats do |chat|
  json.time chat.created_at.strftime('%Y/%m/%d %H:%M')
  json.name chat.user.name
  json.text chat.text
  json.image chat.image
end

#jbuilderファイルに書くと、json型にして返してくれるので、難しいjson形式を返す時に有効！！！！渡しやすいし、描きやすい！


