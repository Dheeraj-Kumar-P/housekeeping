class AddStopTimeToTaskAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :task_assignments, :stop_time, :time
  end
end
