# TA
class TaskAssignment < ApplicationRecord
  belongs_to :task, foreign_key: 'task_id'
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :room, foreign_key: 'room_id'
end
