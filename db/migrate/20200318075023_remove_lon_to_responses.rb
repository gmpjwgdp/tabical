class RemoveLonToResponses < ActiveRecord::Migration[5.1]
  def change
    remove_column :responses, :lon, :string
  end
end
