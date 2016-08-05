class AddTaskIdToTaskAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :task_assignments, :task_id, :integer
  end
end
