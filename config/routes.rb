Rails.application.routes.draw do
  get 'product/list'
  devise_for :users
  root 'items#index'
  resources :items
  resources :users, only: [:edit, :update]
  resources :product_lists, only: [:index]
end
