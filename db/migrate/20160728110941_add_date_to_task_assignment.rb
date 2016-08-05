class AddDateToTaskAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :task_assignments, :date, :date
  end
end
