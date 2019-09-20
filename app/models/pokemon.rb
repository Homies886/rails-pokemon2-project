class Pokemon < ApplicationRecord
  belongs_to :region
  belongs_to :user
  has_many :captures
  has_many :users, through :captures
  accepts_nested_attributes_for :region
end
