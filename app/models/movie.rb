class Movie < ApplicationRecord
  validates :title, :overview, presence: true
  validates :title, uniqueness: true

  # Should not be able to destroy self if has bookmarks children (via an ActiveRecord::InvalidForeignKey error from bookmarks table)
  has_many :bookmarks

  has_many :lists, through: :bookmarks
end
