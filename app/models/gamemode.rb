class Gamemode < ApplicationRecord
  belongs_to :game
  belongs_to :mode
end
