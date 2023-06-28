class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :local
      t.string :genre
      t.text :content
      t.boolean :state
      t.integer :user_id

      t.timestamps
    end
  end
end
