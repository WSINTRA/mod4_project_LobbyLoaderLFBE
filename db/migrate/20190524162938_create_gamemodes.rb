class CreateGamemodes < ActiveRecord::Migration[5.2]
  def change
    create_table :gamemodes do |t|
      t.belongs_to :game, foreign_key: true
      t.belongs_to :mode, foreign_key: true

      t.timestamps
    end
  end
end
