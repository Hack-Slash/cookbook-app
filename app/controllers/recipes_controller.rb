class RecipesController < ApplicationController
  def db_recipe
    @recipe = Recipe.first
    # p @recipe
    render 'myrecipe.html.erb'
  end
end
