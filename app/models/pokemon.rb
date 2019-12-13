class Pokemon < ApplicationRecord
  belongs_to :region
  belongs_to :user
  has_many :captures
  has_many :users, through :captures
  accepts_nested_attributes_for :region

  validates :name, presence: true

  validates :name, uniqueness: { scope: :region, message: "has already been added" }

  def self.alphabetically
    order(:name)
  end

end