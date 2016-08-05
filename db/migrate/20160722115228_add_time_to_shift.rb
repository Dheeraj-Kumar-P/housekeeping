class AddTimeToShift < ActiveRecord::Migration[5.0]
  def change
    add_column :shifts, :time, :time
  end
end
