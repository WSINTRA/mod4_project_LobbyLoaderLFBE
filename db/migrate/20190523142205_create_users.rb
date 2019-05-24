class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :display_name
      t.string :image_url
      t.text :bio
      t.string :tag_line
  
      t.timestamps
    end
  end
end
