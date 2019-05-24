class CreateGamescreenshots < ActiveRecord::Migration[5.2]
  def change
    create_table :gamescreenshots do |t|
      t.string :original_url
      t.string :large_url
      t.string :image_id
      t.belongs_to :game, foreign_key: true
      t.timestamps
    end
  end
end
