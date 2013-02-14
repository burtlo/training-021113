class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :author, :body
  
  validates :author, :body, presence: true
end
