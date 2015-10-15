class Article < ActiveRecord::Base
  has_many :comments
  validates :content, :presence => true
end
