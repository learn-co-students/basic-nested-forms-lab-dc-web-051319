# frozen_string_literal: true

class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def ingredient_attributes=(ingredient)
    self.ingredient = ingredient.find_or_create_by(name: ingredient.name)
    self.ingredient.update(ingredient)
  end
end
