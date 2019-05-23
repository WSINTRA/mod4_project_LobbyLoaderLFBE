class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :name
      t.integer :partysize
      t.text :description
      t.belongs_to :user, foreign_key: true
      t.belongs_to :game, foreign_key: true

      t.timestamps
    end
  end
end
