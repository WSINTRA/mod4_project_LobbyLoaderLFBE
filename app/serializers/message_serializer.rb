class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :user
  has_one :party
  belongs_to :user
end
