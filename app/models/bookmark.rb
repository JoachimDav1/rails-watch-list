class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie

  validates :list, presence: true
  validates :movie, presence: true
  validates_uniqueness_of :list_id, { scope: :movie_id}
  validates :comment, length: { minimum: 6 }
end
