class RemoveLatToResponses < ActiveRecord::Migration[5.1]
  def change
    remove_column :responses, :lat, :string
  end
end
