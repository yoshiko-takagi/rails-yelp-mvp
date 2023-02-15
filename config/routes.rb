Rails.application.routes.draw do
  get 'reviews/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  # HTTP verb 'path' to: 'controllername#action' as: prefix
  # Read all
  root to: 'restaurants#index'
  get '/restaurants', to: 'restaurants#index', as: :restaurants
  # Create_newRestaurant
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant
  post '/restaurants', to: 'restaurants#create'

  # Read one
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant

  # A visitor can add a new review to a restaurant
  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end

end
