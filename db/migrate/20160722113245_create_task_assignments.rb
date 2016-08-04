class CreateTaskAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :task_assignments do |t|

      t.timestamps
    end
  end
end
