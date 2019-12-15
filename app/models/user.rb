class User < ApplicationRecord
    has_many :captures
    has_many :captured_pokemons, through: :captures, source: :pokemon
    has_many :pokemons

    has_secure_password

    validates :username, uniqueness: true, presence: true
    validates :email, presence: true

    def self.create_by_google(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
          u.password = SecureRandom.hex
        end
    end

    def self.create_by_facebook(auth)
      self.find_or_create_by(username: auth[:info][:email]) do |u|
        u.password = SecureRandom.hex
      end
  end

end