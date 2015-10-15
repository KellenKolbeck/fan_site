class Comment < ActiveRecord::Base
  belongs_to :article,
  acts_as_tree order: "created_at"
  validates :user, :presence => true
  validates :content, :presence => true
end
