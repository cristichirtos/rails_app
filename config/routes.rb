Rails.application.routes.draw do
  root   'products#index'

  get    'password_resets/new'
  get    'password_resets/edit'

  get    '/login',                    to: 'sessions#new'
  post   '/login',                    to: 'sessions#create'
  delete '/logout',                   to: 'sessions#destroy'
  get    '/signup',                   to: 'users#new'

  get    '/dashboard',                to: 'dashboard#index'
  post   '/add_to_cart/:product_id',  to: 'carts#add_to_cart', as: 'add_to_cart'
  get    '/cart',                     to: 'carts#index'
  
  resources :products
  resources :users
  resources :account_activations, only: :edit
  resources :password_resets,     only: %i[new create edit update]
end
