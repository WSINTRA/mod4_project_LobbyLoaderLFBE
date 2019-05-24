class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.string :name
      t.string :slug_name
       t.belongs_to :game, foreign_key: true
      t.timestamps
    end
  end
end
