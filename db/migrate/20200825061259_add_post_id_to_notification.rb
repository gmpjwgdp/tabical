class AddPostIdToNotification < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :post_id, :integer
  end
end
