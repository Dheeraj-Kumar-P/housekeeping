# Hotel Model
class Hotel < ApplicationRecord
  validates :name, presence: { strict: true }, uniqueness: { strict: true }
  validates :no_of_rooms, presence: { strict: true }
  validates :address, presence: { strict: true }
  has_one :image, as: :imageable
  has_many :rooms
  has_many :users
end
