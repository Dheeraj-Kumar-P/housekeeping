class AddAddressToHotel < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :address, :string
  end
end
