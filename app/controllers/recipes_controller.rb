# frozen_string_literal: true

class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'ingredient1')
    @recipe.ingredients.build(name: 'ingredient2')
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: %i[name quantity])
  end
end
