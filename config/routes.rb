Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :home, only: [:index]
  resources :store, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :cars

  resources :orders do
    resources :charges
  end

  resources :products do
    resources :images
  end
end
