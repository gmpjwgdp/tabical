class AddLatitudeToResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :latitude, :float
  end
end
