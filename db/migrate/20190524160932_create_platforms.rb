class CreatePlatforms < ActiveRecord::Migration[5.2]
  def change
    create_table :platforms do |t|
      t.string :slug_name
      t.string :name
      t.string :abbreviation
      t.belongs_to :game, foreign_key: true
      t.timestamps
    end
  end
end
