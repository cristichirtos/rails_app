Rails.application.routes.draw do
  root   'products#index'
  get    '/login',        to: 'sessions#new'
  post   '/login',        to: 'sessions#create'
  delete '/logout',       to: 'sessions#destroy'
  get    '/signup',       to: 'users#new'
  get    '/dashboard',    to: 'dashboard#index'
  get    '/add_to_cart',  to: 'carts#add_to_cart'
  resources :products
  resources :users
end
