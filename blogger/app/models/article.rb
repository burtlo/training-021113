class Article < ActiveRecord::Base
  attr_accessible :title, :body
  has_many :comments

  validates :title, :body, presence: true
end
