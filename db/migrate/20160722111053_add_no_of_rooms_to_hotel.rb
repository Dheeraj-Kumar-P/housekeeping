class AddNoOfRoomsToHotel < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :no_of_rooms, :string
  end
end
