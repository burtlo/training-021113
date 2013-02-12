class Recipe

  attr_reader :name

  def initialize(name_or_params,ingredients=nil,instructions=nil,servings=nil)
    parameters = parse_parameters(name_or_params,ingredients,instructions,servings)

    @name = parameters[:name]
    @ingredients = parameters[:ingredients]
    @instructions = parameters[:instructions]
    @servings = parameters[:servings]

  end

  def parse_parameters(name_or_params,ingredients,instructions,servings)
    return name_or_params if name_or_params.is_a? Hash

    { name: name_or_params,
      ingredients: ingredients,
      instructions: instructions,
      servings: servings }
  end

  def ingredients
    @ingredients ||= []
  end

  def include?(*items)
    has_ingredients(items).include? true
  end

  def all?(*items)
    !has_ingredients(items).include? false
  end

  private

  def has_ingredients(items)
    items.map {|item| has_ingredient(item) }
  end

  def has_ingredient(item)
    !! ingredients.find { |ingredient| ingredient.include? item }
  end



end