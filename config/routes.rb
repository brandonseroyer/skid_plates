Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :home, only: [:index]
  resource :cart, only: [:show]
  resources :orders
  resources :order_items, only: [:create, :update, :destroy]
  resources :products do
    resources :images
  end
end
