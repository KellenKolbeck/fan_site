class Comment < ActiveRecord::Base
  belongs_to :article
  validates :user, :presence => true
  validates :content, :presence => true
  has_ancestry
end
