Rails.application.routes.draw do
  # get '/' => 'recipes#index'
  get '/recipes' => 'recipes#index'
  get '/recipes/new' => 'recipes#new'
  get '/recipes/:id' => 'recipes#show'
  # make a route that the form will post to
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
