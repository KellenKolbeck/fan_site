class Article < ActiveRecord::Base
  has_many :comments
  validates :content, :presence => true
  def alphabetical
    self.sort
  end
end
