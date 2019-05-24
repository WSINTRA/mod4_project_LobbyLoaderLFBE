class OwnedgameSerializer < ActiveModel::Serializer
  attributes :id
  has_one :User
  has_one :Game
end
