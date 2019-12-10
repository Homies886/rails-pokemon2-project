class Capture < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  validates :pokeball, presence: true
end
