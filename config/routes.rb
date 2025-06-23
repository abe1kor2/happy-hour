Rails.application.routes.draw do
  root "restaurants#index"

  resources :restaurants, param: :slug
  resources :deals, only: [:new, :create, :edit, :update, :destroy]

  get '/map', to: 'maps#show', as: 'map'

  get "up" => "rails/health#show", as: :rails_health_check
end
