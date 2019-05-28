class UserSerializer < ActiveModel::Serializer
attributes :id, :username, :email, :image_url, :display_name, :bio, :tag_line

    has_many :messages
	has_many :owned_parties, class_name: 'Party'

	has_many :playerinterests
	has_many :genres, through: :playerinterests

	has_many :games, through: :ownedgames

 
	has_many :parties

	has_many :games, through: :owned_parties
end
