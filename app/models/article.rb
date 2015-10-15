class Article < ActiveRecord::Base
  has_many :comments
  validates :content, :presence => true
  def add_point(count=1)
    update_attribute(:rating, rating + count)
  end
  def subtract_point(count=1)
    update_attribute(:rating, count - rating)
  end
end
