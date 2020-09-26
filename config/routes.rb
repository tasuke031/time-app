Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users
  root 'rooms#index'
  resources :rooms, only: [:index, :create, :show, :destroy] do
    resources :messages, only: :create
  end
  get '/show_additionally', to: 'rooms#show_additionally'
end
