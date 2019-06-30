class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :whohashair
  has_one :party
  belongs_to :user


end
