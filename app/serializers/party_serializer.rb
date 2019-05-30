class PartySerializer < ActiveModel::Serializer
  attributes :id, :name, :partysize, :description, :space
  has_one :user
  has_one :game
  has_many :users
  has_many :messages

  def space
  	{taken: "#{self.object.users.length+1}", available: "#{self.object.partysize-1-self.object.users.length}"}
  end
end
