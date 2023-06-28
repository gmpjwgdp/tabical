class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.string :name
      t.integer :post_id
      t.boolean :ba
      t.string :address
      t.float :lat
      t.float :lon
      t.string :genre
      t.string :tag
      t.string :summary
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
