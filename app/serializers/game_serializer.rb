class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :summary, :slug_name
  	
	has_many :coverimages

end
