class PartySerializer < ActiveModel::Serializer
  attributes :id, :name, :partysize
  has_one :user
  has_one :game
end
