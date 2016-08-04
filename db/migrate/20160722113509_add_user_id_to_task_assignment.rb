class AddUserIdToTaskAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :task_assignments, :user_id, :integer
  end
end
