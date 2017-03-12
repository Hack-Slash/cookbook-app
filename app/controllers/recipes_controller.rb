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
    @recipe = Recipe.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
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

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    render 'destroy.html.erb'
  end
end
