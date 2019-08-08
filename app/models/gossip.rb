class Gossip < ApplicationRecord
  validates :title, presence: true, length: { in: 3..14, message: "must be between 3 and 14 charachters" }
  validates :content, presence: true
  belongs_to :user
  has_many :table_join_tag_gossips
  has_many :tags, through: :table_join_tag_gossips
  has_many :comments, as: :commentable
  has_many :likes
end
 