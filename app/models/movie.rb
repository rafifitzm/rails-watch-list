class Movie < ApplicationRecord
  validates :title, :overview, :rating, presence: true
  validates :title, uniqueness: true

  has_many :bookmarks, dependent: :destroy
  has_many :lists, through: :bookmarks
end
