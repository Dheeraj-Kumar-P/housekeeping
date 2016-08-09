# Hotel Model
class Hotel < ApplicationRecord
  validates :name, presence: { strict: true }, uniqueness: { strict: true }
  validates :no_of_rooms, presence: { strict: true }
  validates :address, presence: { strict: true }
  has_attached_file :photo,
                    styles: { large: '600x600>',
                              medium: '300x300>',
                              thumb: '150x150#' },
                    url: '/:class/:attachment/:id/:style_:basename.:extension'
  validates_attachment_content_type :photo, content_type: '/\Aimage\/.*\Z/'
  has_many :rooms
  has_many :users
  # has_attached_file :photo
end
