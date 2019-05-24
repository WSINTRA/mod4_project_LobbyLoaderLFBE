class GamegenreSerializer < ActiveModel::Serializer
  attributes :id
  has_one :game
  has_one :genre
end
