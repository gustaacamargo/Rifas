Rails.application.routes.draw do
  resources :awards
  resources :tickets
  resources :raffles
  resources :users
  resources :kinds
  root to: 'raffles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
