class CreateWebsites < ActiveRecord::Migration[5.2]
  def change
    create_table :websites do |t|
      t.string :url
      t.string :name
      t.belongs_to :game, foreign_key: true
      t.timestamps
    end
  end
end
