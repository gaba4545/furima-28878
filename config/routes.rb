Rails.application.routes.draw do
  devise_for :users
  get 'product/list'
  root 'items#index'
  resources :items do
   resources :addresses, only:[:create ,:index]
  end
  resources :users, only: [:edit, :update]
  resources :cards, only: [:new, :create]
end
