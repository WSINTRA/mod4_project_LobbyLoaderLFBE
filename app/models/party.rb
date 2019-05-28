class Party < ApplicationRecord

  belongs_to :user
  belongs_to :game

  has_many :messages

  has_many :partymembers, :dependent => :delete_all
  has_many :users, through: :partymembers

end
