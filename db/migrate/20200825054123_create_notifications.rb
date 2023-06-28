class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :contributor_id
      t.string :content
      t.boolean :state
      t.integer :target_id

      t.timestamps
    end
  end
end
