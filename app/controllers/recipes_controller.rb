class RecipesController < ApplicationController
  def index
    @recipes =  Recipe.all
    render 'index.html.erb'
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    # make the actual recipe in the db
    @recipe = Recipe.new(
      title: params['form_title'],
      chef: params['form_chef'],
      ingredients: params['form_ingredients'],
      directions: params['form_directions'],
      image: params['form_image'],
      prep_time: params['form_prep_time']
      )
    @recipe.save
    # show them a view with the info of the recipe they just created
    render 'create.html.erb'
  end

  def edit
    render 'edit.html.erb'
  end

  def update
    # can only update the third one
    # ruins everything if you don't fill in all the fields
    # not showing changes after update
    # does not show default values
    @recipe = Recipe.find_by(id: params['id'])
    @recipe.update(
      title: params['form_title'],
      chef: params['form_chef'],
      ingredients: params['form_ingredients'],
      directions: params['form_directions'],
      image: params['form_image'],
      prep_time: params['form_prep_time']
      )
    render 'update.html.erb'
  end
end
