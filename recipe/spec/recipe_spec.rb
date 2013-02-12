require 'spec_helper'
require 'recipe'

describe Recipe do

  let(:recipe_name) { "Chocolate Chip Cookies" }
  let(:ingredients) {  [ "1 cup white sugar"] }
  let(:instructions) { [ "Preheat oven 350 degrees" ] }
  let(:servings) { "1 dozen cookies" }

  context "when initialized with 3 parameters" do

    let(:recipe) do
      Recipe.new recipe_name,
        ingredients,
        instructions
    end

    it "name should be set correctly" do
      expect(recipe.name).to eq recipe_name
    end

  end

  context "when initialized with 4 parameters" do

    let(:recipe) do
      Recipe.new recipe_name, ingredients, instructions, servings
    end

    it "name should be set correctly" do
      expect(recipe.name).to eq recipe_name
    end

  end

  context "when initialized with named parameters" do

    let(:recipe) do
      recipe_parameters = { name: recipe_name,
        ingredients: ingredients,
        instructions: instructions,
        servings: servings }

      Recipe.new recipe_parameters
    end

    it "name should be set correctly" do
      expect(recipe.name).to eq recipe_name
    end

  end

end