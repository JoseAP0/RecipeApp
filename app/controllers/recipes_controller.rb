class RecipesController < ApplicationController

  def index
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def new
    @recipe = Recipe.new
  end
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe successfully created."
      redirect_to root_path
    else
      redirect_to root_path
      flash[:error] = "An error ocurred."
    end
  end

  def search
    @query = params[:search]
    @result = Recipe.where("LOWER (name) LIKE ?", "%#{@query.downcase}%")
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :duration, :prepare, ingredients_attributes:[:name])
  end
end
