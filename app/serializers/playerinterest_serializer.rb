class PlayerinterestSerializer < ActiveModel::Serializer
  attributes :id
  has_one :User
  has_one :Genre
end
