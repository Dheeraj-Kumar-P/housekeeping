class AddNoOfMaidToHotel < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :no_of_maid, :integer
  end
end
