require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tickets, only: [] do
        get :buy, on: :member
      end
    end
  end
  devise_for :users
  resources :awards
  resources :tickets
  resources :raffles
  resources :kinds
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end
  get '/modal/:id/:ticketId', to: 'raffles#modal'
  root to: 'home#index'

  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
