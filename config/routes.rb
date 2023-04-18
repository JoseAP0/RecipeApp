Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"

  get '/all', to: 'recipes#all'
  get '/search', to: 'recipes#search'
  post :recipes, to: 'recipes#create'
end
