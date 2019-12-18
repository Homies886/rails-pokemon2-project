class Capture < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  validates :pokeball, presence: true

  validates :pokemon, uniqueness: { scope: :user, message: "has already been caught by you" }

  validate :is_valid_catch_date

  scope :order_by_date_captured, -> {order(captured: :desc)}

  private

  def is_valid_catch_date
    if Date.today < captured
      errors.add(:captured, 'Sorry, date captured cannot be in the future.')
    end
  end

end