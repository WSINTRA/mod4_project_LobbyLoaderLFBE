class Genre < ApplicationRecord

	has_many :playerinterests
	has_many :users, through: :playerinterests

	has_many :genregames
	has_many :games, through: :genregames

end
