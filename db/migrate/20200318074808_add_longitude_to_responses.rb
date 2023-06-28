class AddLongitudeToResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :longitude, :float
  end
end
