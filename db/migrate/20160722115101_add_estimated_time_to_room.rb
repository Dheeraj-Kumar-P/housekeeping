class AddEstimatedTimeToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :estimated_time, :time
  end
end
