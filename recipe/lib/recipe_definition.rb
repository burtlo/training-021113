require_relative 'recipe'

class Fixnum
  def cup
   "#{self} cup"
  end

  def dozen
    self * 12
  end
end

class RecipeDefinition

  def initialize(&block)
    instance_eval(&block) if block
  end

  def self.parse(contents)
    recipe_definition = self.new
    recipe_definition.instance_eval(contents)
    recipe_definition
  end

  def name(value=nil)
    value ? @name = value : @name
  end

  def ingredients
    @ingredients ||= []
  end

  def instructions
    @instructions ||= []
  end

  def instruction(text)
    instructions << text
  end

  def ingredient(component,quantity,description)
    ingredients << "#{quantity} #{component}, #{description}"
  end

  def serves(amount,units)
    @serves = "#{amount} #{units}"
  end

  def generate_recipe
    Recipe.new name: @name,
               ingredients: ingredients,
               instructions: instructions,
               serves: @serves
  end


end

definition = RecipeDefinition.new
definition.name "Chocolate Chip Cookies"
definition.ingredient "butter", 1.cup, "softened"
definition.instruction "Preheat oven to 350 degrees F (175 degrees C)."
definition.serves 4.dozen, "cookies"


definition = RecipeDefinition.new do |d|
  d.name "Chocolate Chip Cookies"
  d.ingredient "butter", 1.cup, "softened"
  d.instruction "Preheat oven to 350 degrees F (175 degrees C)."
  d.serves 4.dozen, "cookies"
end

recipe_string = %{
  name "Chocolate Chip Cookies"
  ingredient "butter", 1.cup, "softened"
  instruction "Preheat oven to 350 degrees F (175 degrees C)."
  serves 4.dozen, "cookies"
}

definition = RecipeDefinition.parse(recipe_string)

cookies = definition.generate_recipe
puts definition.name
puts cookies.name
