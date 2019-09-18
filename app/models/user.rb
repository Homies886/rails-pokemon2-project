class User < ApplicationRecord
    has_many :captures
    has_many :captured_pokemons, through: :captures, source: :pokemon
    has_many :pokemons

    has_secure_password

    validates :username, uniqueness: true, presence: true
end