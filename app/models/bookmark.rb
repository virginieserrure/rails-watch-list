class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie_id, uniqueness: { scope: :list_id }
  validates :comment, length: { minimum: 6 }

  # Le signet est unique pour un couple de films/listes donné
end
