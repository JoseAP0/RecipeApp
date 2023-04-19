Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"

  devise_for :users
  get '/new_recipe', to: "recipes#new_recipe"
  get '/all', to: 'recipes#all'
  get '/search', to: 'recipes#search'
  get '/create', to: 'recipes#submit'

  get '/list', to: 'recipes#list'

  get :update, to: 'recipes#update'
  patch '/recipes/:id', to: 'recipes#update'
  post :recipes, to: 'recipes#create'
end
