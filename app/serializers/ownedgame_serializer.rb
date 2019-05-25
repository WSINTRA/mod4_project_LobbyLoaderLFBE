class OwnedgameSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :game_id
  has_one :User
  has_one :Game
end
