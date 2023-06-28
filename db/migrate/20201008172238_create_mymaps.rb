class CreateMymaps < ActiveRecord::Migration[5.1]
  def change
    create_table :mymaps do |t|
      t.integer :response_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
