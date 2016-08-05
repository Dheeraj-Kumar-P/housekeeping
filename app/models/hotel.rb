# Hotel Model
class Hotel < ApplicationRecord
  has_many :rooms
  has_many :users
end
