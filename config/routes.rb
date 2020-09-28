Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users
  root 'rooms#index'
  resources :rooms, only: [:index, :create, :show, :destroy, :show_additionally] do
    member do
      get 'show_additionally'
    end
    resources :messages, only: :create
  end
  
end
