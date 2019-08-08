class Comment < ApplicationRecord
  validates :content, presence:true
  has_many :likes
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
