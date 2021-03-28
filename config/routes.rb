Rails.application.routes.draw do
  devise_for :users
  resources :awards
  resources :tickets
  resources :raffles
  resources :kinds
  devise_scope :user do
    root to: 'raffles#index'
    get 'users/sign_out' => "devise/sessions#destroy"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
