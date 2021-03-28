Rails.application.routes.draw do
  devise_for :users
  resources :awards
  resources :tickets
  resources :raffles
  resources :kinds
  root to: 'raffles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
