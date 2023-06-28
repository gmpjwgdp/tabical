class AddImgToResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :img, :string
  end
end
