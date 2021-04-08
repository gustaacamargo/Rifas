require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :awards
  resources :tickets
  resources :raffles
  resources :kinds
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end
  get '/modal/:id/:ticketId', to: 'raffles#modal'
  root to: 'raffles#index'

  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
