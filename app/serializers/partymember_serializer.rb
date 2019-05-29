class PartymemberSerializer < ActiveModel::Serializer
  attributes :party
  has_one :party
end
