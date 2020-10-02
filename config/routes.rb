Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root 'rooms#index'
  devise_for :users
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
    post '/users/guest2_sign_in', to: 'users/sessions#new_guest2'
  end
  resources :rooms, only: [:index, :create, :show, :destroy, :show_additionally] do
    member do
      get 'show_additionally'
    end
    resources :messages, only: :create
  end

end
