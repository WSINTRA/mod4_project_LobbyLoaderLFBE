class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.string :name
      t.string :slug_name
      t.integer :igdb_id
      t.timestamps
    end
  end
end
