class ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_one :game
  has_one :platform
end
