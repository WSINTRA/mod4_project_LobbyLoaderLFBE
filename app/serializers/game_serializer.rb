class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :summary, :slug_name
  	
	has_many :coverimages
	has_many :parties

end
