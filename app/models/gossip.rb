class Gossip < ApplicationRecord
  belongs_to :user
  has_many :table_join_tag_gossips
  has_many :tags, through: :table_join_tag_gossips
  has_many :comments, as: :commentable
  has_many :likes
end
