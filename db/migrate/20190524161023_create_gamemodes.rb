class CreateGamemodes < ActiveRecord::Migration[5.2]
  def change
    create_table :gamemodes do |t|
      t.string :slug_name
      t.string :name
      t.belongs_to :game, foreign_key: true

      t.timestamps
    end
  end
end
