class City < ApplicationRecord
  validates :zipcode, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :users
end
