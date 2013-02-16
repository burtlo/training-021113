
module Document

  def element(name,default_value)

    # define a method that builds a setter
    define_method "#{name}=" do |value|
      instance_variable_set("@#{name}",value)
    end


    # define a method that builds a getter
    define_method name do
      instance_variable_get("@#{name}") || default_value
    end

  end

end

class Article
  extend Document

  # def self.element ....
  element :title, "Choke"

end


article = Article.new
article.find_or_create_by_name("Great Gatsby")
puts article.title
article.title = "War and Peace"
puts article.title