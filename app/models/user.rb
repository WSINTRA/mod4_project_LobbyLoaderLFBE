class User < ApplicationRecord

	validates :username, uniqueness: { case_sensitive: false }
	has_secure_password

	has_many :messages
	has_many :owned_parties, class_name: 'Party'

	has_many :playerinterests
	has_many :genres, through: :playerinterests

	has_many :ownedgames
	has_many :games, through: :ownedgames

	has_many :partymembers
	has_many :parties, through: :partymembers

end
