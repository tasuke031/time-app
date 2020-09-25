Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  resources 'rooms', only: [:index, :new, :create, :show, :destroy]
end
