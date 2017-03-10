Rails.application.routes.draw do
  get '/' => 'recipes#index'
  get '/recipes' => 'recipes#index'
  get '/recipes/:id' => 'recipes#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
