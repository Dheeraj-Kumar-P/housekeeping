class AddNameToHotel < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :name, :string
  end
end
