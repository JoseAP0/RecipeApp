class RecipesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :submit]
  def index
  end
  def edit
    @recipe = Recipe.update(recipe_params)
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      flash[:success] = 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe successfully created."
      redirect_to root_path
      puts('deu bom')
    else
      redirect_to root_path
      flash[:error] = "An error ocurred."
      puts('deu ruim')
    end
  end

  def submit
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build
    render 'create'
  end

  def search
    @query = params[:search]
    @result = Recipe.where("LOWER (name) LIKE ?", "%#{@query.downcase}%")
  end

  def all
    @result = Recipe.all
  end

  def list
    if user_signed_in?
    @result = current_user.recipes
    else
      flash[:warning] = "You are not logged in."
      redirect_to root_path
    end
  end

  private

  def update_recipe_params
    params.permit(:id)
  end
  def recipe_params
    params.require(:recipe).permit(:name, :description, :duration, :prepare, ingredients_attributes: [:name])
  end
end
