# Room
class Room < ApplicationRecord
  belongs_to :hotel, foreign_key: 'hotel_id'
  has_many :task_assignment
end
