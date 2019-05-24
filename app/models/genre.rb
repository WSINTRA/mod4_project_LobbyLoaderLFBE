class Genre < ApplicationRecord

	has_many :playerinterests
	has_many :users, through: :playerinterests

	has_many :gamegenres
	has_many :games, through: :gamegenres

end
