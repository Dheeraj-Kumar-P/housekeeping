class AddHotelIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hotel_id, :integer
  end
end
