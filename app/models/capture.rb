class Capture < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  validates :pokeball, presence: true

  validates :pokemon, uniqueness: { scope: :user, message: "has already been caught by you" }

end
