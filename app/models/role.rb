# Role
class Role < ApplicationRecord
  has_many :users
  scope :staff, -> { find_by(name: 'Staff').id }
  scope :maid, -> { find_by(name: 'Maid').id }
  scope :admin, -> { find_by(name: 'Admin').id }
end
