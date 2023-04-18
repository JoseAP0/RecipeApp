class RecipesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :submit]
  def index
  end
  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe successfully created."
      redirect_to root_path
      puts ('deu bom')
    else
      redirect_to root_path
      flash[:error] = "An error ocurred."
      puts ('deu ruim')
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

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :duration, :prepare, ingredients_attributes: [:name])
  end
end
