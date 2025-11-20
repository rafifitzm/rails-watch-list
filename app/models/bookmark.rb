class Bookmark < ApplicationRecord
  # A bookmark must be linked to a movie and a list
  # The comment of a bookmark cannot be shorter than 6 characters.
  validates :movie_id, :list_id, presence: true
  validates :comment, length: { minimum: 6 }

  # The [movie, list] pairings should be unique:
  validates :movie_id, uniqueness: { scope: :list_id }

  belongs_to :movie
  belongs_to :list
end
