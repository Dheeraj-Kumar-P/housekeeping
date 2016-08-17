# Hotel Model
class Hotel < ApplicationRecord
  validates :name, presence: { strict: true }, uniqueness: { strict: true }
  validates :no_of_rooms, presence: { strict: true }
  validates :address, presence: { strict: true }
  has_attached_file :photo,
                    styles: { large: '600x600>',
                              medium: '300x300>',
                              thumb: '100x100#' },
                    keep_old_files: true,
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  has_many :rooms
  has_many :users
end
