require 'spec_helper'
require 'recipe'

describe Recipe do

  let(:recipe_name) { "Chocolate Chip Cookies" }
  let(:ingredients) {  [ "1 cup white sugar", "1 cup walnuts"] }
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

  describe "#include?" do

    let(:recipe) do
      recipe_parameters = { name: recipe_name,
        ingredients: ingredients,
        instructions: instructions,
        servings: servings }

      Recipe.new recipe_parameters
    end

    context "when the recipe contains 'sugar'" do
      it "returns a true value" do
        result = recipe.include?('sugar')
        expect(result).to be_true
      end
    end

    context "when the recipe does not contain 'peanut'" do
      it "returns a true value" do
        result = recipe.include?('peanut')
        expect(result).to be_false
      end
    end

    context "when the recipe contains 'sugar' or 'peanut'" do
      it "returns a true value" do
        result = recipe.include?('sugar','peanut')
        expect(result).to be_true
      end
    end

  end
  
  describe "#include?" do

    let(:recipe) do
      recipe_parameters = { name: recipe_name,
        ingredients: ingredients,
        instructions: instructions,
        servings: servings }

      Recipe.new recipe_parameters
    end

    context "when the recipe contains 'sugar' and 'walnut'" do
      it "returns a true value" do
        result = recipe.all?('sugar','walnut')
        expect(result).to be_true
      end
    end
    
    context "when the recipe contains 'sugar' but not 'peanut'" do
      it "returns a true value" do
        result = recipe.all?('sugar','peanut')
        expect(result).to be_false
      end
    end
    
  end
  

end