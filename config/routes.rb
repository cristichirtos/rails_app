Rails.application.routes.draw do
  root 'products#index'
  get '/dashboard', to: 'dashboard#index'
  resources :products
end
