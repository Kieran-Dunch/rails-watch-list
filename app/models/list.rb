class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end


# validates :comment, length: { minimum: 6 }
# validates :movie_id, presence: true, uniqueness: { scope: list }
# validates :list_id, presence: true
