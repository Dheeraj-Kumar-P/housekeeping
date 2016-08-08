# User Model
class User < ApplicationRecord
  validates :name, presence: { strict: true }, uniqueness: { strict: true }
  validates :password, presence: { strict: true }

  validates :email, presence: { strict: true }

  validates :phone_no, presence: { strict: true }

  belongs_to :hotel, foreign_key: 'hotel_id'
  belongs_to :role, foreign_key: 'role_id'
  belongs_to :shift, foreign_key: 'shift_id'
  has_one :salary, foreign_key: 'salary_id'
  has_many :task_assignments
end
