Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  resources 'rooms', only: [:index, :create, :show, :destroy] do
    resources 'messages', only: :create
  end
end
