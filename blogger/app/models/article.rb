class Article < ActiveRecord::Base
  attr_accessible :title, :body, :tag_list
  validates :title, :body, presence: true

  has_many :comments, dependent: :destroy

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings


  def tag_list
    tags.collect { |tag| tag.name }.join(", ")
  end

  def tag_list=(value)
    tag_names = tag_list_to_tag_names(value)
    found_tags = tag_names.map { |name| Tag.find_or_create_by_name name }
    self.tags = found_tags
  end

  def tag_list_to_tag_names(value)
    value.split(",").map {|name| name.strip.downcase }
  end

end
