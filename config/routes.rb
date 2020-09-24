Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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
