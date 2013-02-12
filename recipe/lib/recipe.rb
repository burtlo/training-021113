class Recipe

  attr_accessor :name

  def initialize(name,ingredients,instructions,servings=nil)
    @name = name
    @ingredients = ingredients
    @instructions = instructions
    @servings = servings
  end

  def initialize(parameters)
    @name = parameters[:name]
    @ingredients = parameters[:ingredients]
    @instructions = parameters[:instructions]
    @servings = parameters[:servings]
  end

  def initialize(parameters,ingredients=nil,instructions=nil,servings=nil)
    
    if parameters.is_a? Hash
      @name = parameters[:name]
      @ingredients = parameters[:ingredients]
      @instructions = parameters[:instructions]
      @servings = parameters[:servings]
    else
      @name = parameters
      @ingredients = ingredients
      @instructions = instructions
      @servings = servings
    end
  end

  def name
    @name
  end

end