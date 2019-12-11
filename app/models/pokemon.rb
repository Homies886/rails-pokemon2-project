class Pokemon < ApplicationRecord
  belongs_to :region
  belongs_to :user
  has_many :captures
  has_many :users, through :captures
  accepts_nested_attributes_for :region

  validates :name, presence: true
  validate :not_a_duplicate

  def not_a_duplicate
    pokemon = Pokemon.find_by(name: name, region_id: region_id)
    if !!pokemon && pokemon != self
      errors.add(:name, 'has already been added from that region')
    end
  end

end