class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :summary, :slug_name
  	
	has_many :coverimages
	has_many :parties
	has_many :genres
	has_many :keywords
	has_many :screenshots
	has_many :releases
	has_many :platforms
	has_many :modes
end
