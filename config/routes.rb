Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
  devise_for :users
  resources :users, only: [:show]
  resources :events, only: [:index, :create]
  resources :attendances, only: [:create]

end
