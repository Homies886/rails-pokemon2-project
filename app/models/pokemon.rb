class Pokemon < ApplicationRecord
  belongs_to :region
  belongs_to :user
  has_many :captures
  has_many :users, through :captures
  accepts_nested_attributes_for :region

  validates :name, presence: true
  validate :not_a_duplicate

  validates :name, uniqueness: { scope: :region, message: "has already been caught by you"  }

end