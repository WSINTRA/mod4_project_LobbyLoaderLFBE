class Keyword < ApplicationRecord
	has_many :gamekeywords
	has_many :games, through: :gamekeywords

	def self.createKeyword (keyword_array)
		keyword_array.each do |keyword|
			if(Keyword.find_by(igdb_id: keyword["id"]).nil?)
				Keyword.create(name: keyword["name"], slug_name: keyword["slug"], igdb_id: keyword["id"])
			end
		end
	end
end
