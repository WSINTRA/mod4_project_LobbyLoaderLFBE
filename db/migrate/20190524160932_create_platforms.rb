class CreatePlatforms < ActiveRecord::Migration[5.2]
  def change
    create_table :platforms do |t|
      t.string :name
      t.string :alt_name
      t.string :slug_name
      t.string :abbreviation
      t.integer :igdb_id
      t.timestamps
    end
  end
end
