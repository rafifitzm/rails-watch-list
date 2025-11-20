class Movie < ApplicationRecord
  validates :title, :overview, :rating, presence: true
  validates :title, uniqueness: true
end
