class Article < ActiveRecord::Base
  has_many :comments, :as => :commentable
  validates :content, :presence => true
end
