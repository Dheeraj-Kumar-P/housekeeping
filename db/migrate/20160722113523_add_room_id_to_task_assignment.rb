class AddRoomIdToTaskAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :task_assignments, :room_id, :integer
  end
end
