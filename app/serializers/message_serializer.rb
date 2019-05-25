class MessageSerializer < ActiveModel::Serializer
  attributes :content
  has_one :user
  has_one :chat
end
