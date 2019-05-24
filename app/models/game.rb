class Game < ApplicationRecord

	has_many :parties

	has_many :gamegenres
	has_many :genres, through: :gamegenres

	has_many :ownedgames
	has_many :users, through: :ownedgames

end
