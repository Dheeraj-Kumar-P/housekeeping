class AddImageIdToHotel < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :image_id, :string
    add_column :hotels, :integer, :string
  end
end
