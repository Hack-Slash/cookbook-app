class RecipesController < ApplicationController
  def index
    # if params[:sort] == 'prep_time'
    #   @recipes =  Recipe.all.order(:prep_time)
    # elsif params[:sort] == 'title'
    #   @recipes =  Recipe.all.order(:title)
    # else
    #   @recipes = Recipe.all
    # end
    if params[:category]
      @recipes = Category.find_by(name: params[:category]).recipes
    else
      @recipes = Recipe.all
    end

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
      prep_time: params['form_prep_time'],
      user_id: session[:user_id]
    )
    @recipe.save
    p '*' * 50
    p @recipe.errors
    flash[:success] = "You just created a new recipe"
    # show them a view with the info of the recipe they just created
    # render just shows you the html from that view
    redirect_to "/recipes/#{@recipe.id}"
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
    flash[:info] = "You just changed some attributes of the recipe"
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:danger] = "You deleted a thing"
    redirect_to "/recipes"
  end
end
