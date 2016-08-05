class AddShiftIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :shift_id, :integer
  end
end
