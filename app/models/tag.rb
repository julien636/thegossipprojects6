class Tag < ApplicationRecord
  has_many :table_join_tag_gossips
  has_many :gossips, through: :table_join_tag_gossips
end
