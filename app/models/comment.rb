class Comment < ApplicationRecord
  has_many :likes
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
