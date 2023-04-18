Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"

  get '/new_recipe', to: "recipes#new_recipe"
  get '/all', to: 'recipes#all'
  get '/search', to: 'recipes#search'
  get '/create', to: 'recipes#submit'
  post '/create', to: 'recipes#create'
end
