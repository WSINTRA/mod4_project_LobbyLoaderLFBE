class GamekeywordSerializer < ActiveModel::Serializer
  attributes :id
  has_one :game
  has_one :keyword
end
