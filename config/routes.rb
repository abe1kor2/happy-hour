Rails.application.routes.draw do
  root "restaurants#index"

  # Session routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :restaurants, param: :slug
  resources :deals, only: [:new, :create, :edit, :update, :destroy]

  get '/map', to: 'maps#show', as: 'map'

  get "up" => "rails/health#show", as: :rails_health_check
end
