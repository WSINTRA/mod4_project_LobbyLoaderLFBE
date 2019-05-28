class PartySerializer < ActiveModel::Serializer
  attributes :id, :name, :partysize, :description
  has_one :user
  has_one :game

  has_many :partymembers
  has_many :users, through: :partymembers
end
