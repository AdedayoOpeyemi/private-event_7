Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
  devise_for :users
  resources :users, only: [:show]
  resources :events, only: [:index, :create, :show, :destroy, :edit]
  resources :attendances, only: [:create, :destroy]

  post '/events/:event_id/attend', to: 'attendances#attend', as: 'attend'
  post '/events/:event_id/unattend', to: 'attendances#unattend', as: 'unattend'

end
