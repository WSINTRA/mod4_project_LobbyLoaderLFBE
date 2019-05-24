class CreatePlayerinterests < ActiveRecord::Migration[5.2]
  def change
    create_table :playerinterests do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :genre, foreign_key: true

      t.timestamps
    end
  end
end
