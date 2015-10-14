class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  belongs_to :article
  validates :user, :presence => true
  validates :content, :presence => true
end
