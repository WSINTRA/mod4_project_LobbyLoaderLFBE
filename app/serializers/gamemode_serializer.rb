class GamemodeSerializer < ActiveModel::Serializer
  attributes :id
  has_one :game
  has_one :mode
end
