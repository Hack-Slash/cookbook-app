class RecipesController < ApplicationController
  def db_recipe
    @recipe = Recipe.first
    render 'myrecipe.html.erb'
  end
end
