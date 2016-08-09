# Hotel Model
class Hotel < ApplicationRecord
  validates :name, presence: { strict: true }, uniqueness: { strict: true }
  validates :no_of_rooms, presence: { strict: true }

  validates :no_of_staff, presence: { strict: true }

  validates :no_of_maid, presence: { strict: true }
  has_many :rooms
  has_many :users
  # has_attached_file :image
end
