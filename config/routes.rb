Rails.application.routes.draw do
  root "restaurants#index"

  resources :restaurants
  resources :deals, only: [:new, :create, :edit, :update, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end
