class AddStatusToTaskAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :task_assignments, :status, :string
  end
end
