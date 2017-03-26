Rails.application.routes.draw do
  # get '/' => 'recipes#index'
  get '/recipes' => 'recipes#index'
  # new's job is to show a form. that's it
  get '/recipes/new' => 'recipes#new'
  # make a route that the form will post to
  post '/recipes' => 'recipes#create'
  get '/recipes/:id' => 'recipes#show'
  get '/recipes/:id/edit' => 'recipes#edit'
  patch '/recipes/:id' => 'recipes#update'
  delete '/recipes/:id' => 'recipes#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  #  the login form
  get '/login' => 'sessions#new'
  # creates the new session
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
