class AddStartToTaskAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :task_assignments, :start_time, :time
  end
end
