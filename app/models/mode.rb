class Mode < ApplicationRecord

	has_many :gamemodes
	has_many :games, through: :gamemodes



	def self.createMode (game_mode_array)
		game_mode_array.each do |mode|
			if(Mode.find_by(igdb_id: mode["id"]).nil?)
				Mode.create(name: mode["name"], slug_name: mode["slug"], igdb_id: mode["id"])
			end
		end
	end
end
