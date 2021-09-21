Rails.application.routes.draw do
  resources :chat_rooms
  resources :participant
  post '/chat_rooms/join', to: 'chat_rooms#join_room'
  post '/chat_rooms/send_message', to: 'chat_rooms#send_message'
end
