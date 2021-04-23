Rails.application.routes.draw do
  root 'products#index'
  get 'main_page/home'
  resources :products
end
