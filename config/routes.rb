Rails.application.routes.draw do
  resources :chat_rooms
  resources :participant
  post '/chat_rooms/join', to: 'chat_rooms#join_room'
end
