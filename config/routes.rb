Rails.application.routes.draw do
  get '/the-recipe' => 'recipes#db_recipe'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
