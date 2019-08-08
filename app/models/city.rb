class City < ApplicationRecord
  validates :zip_code, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :users
end
