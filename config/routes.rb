Rails.application.routes.draw do
  root   'products#index'

  get    'password_resets/new'
  get    'password_resets/edit'

  get    '/login',                    to: 'sessions#new'
  post   '/login',                    to: 'sessions#create'
  delete '/logout',                   to: 'sessions#destroy'
  get    '/signup',                   to: 'users#new'

  get    '/dashboard',                to: 'dashboard#index'

  resources :users
  resources :account_activations, only: :edit
  resources :password_resets,     only: %i[new create edit update]
  
  resource :cart,                 only: %i[show destroy]

  resources :orders, only: %i[create index] do 
    patch :toggle_handled, on: :member
  end
  
  resources :products do 
    post :add_to_cart,      on: :member
    post :remove_from_cart, on: :member
  end
end
