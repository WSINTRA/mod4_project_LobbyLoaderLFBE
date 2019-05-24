class CreateReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :releases do |t|
      t.string :date
      t.belongs_to :game, foreign_key: true
      t.belongs_to :platform, foreign_key: true

      t.timestamps
    end
  end
end
