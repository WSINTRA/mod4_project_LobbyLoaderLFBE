class CreateGamekeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :gamekeywords do |t|
      t.belongs_to :game, foreign_key: true
      t.belongs_to :keyword, foreign_key: true

      t.timestamps
    end
  end
end
