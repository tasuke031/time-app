Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root to: 'rooms#index'
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :chats, only: [:index, :create]

    namespace :api do
      resources :chats, only: :index, defaults: { format: 'json' }
    end
  end
  get 'rooms/:room_id/chats', to: 'chats#index'
  post 'rooms/:room_id/chats', to: 'chats#create'
end
