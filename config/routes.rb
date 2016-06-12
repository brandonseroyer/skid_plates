Rails.application.routes.draw do
  devise_for :users
    root to: 'home#index'

    resources :home, :only => [:index]

    resources :products
end
