# image
class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_attached_file :image,
                    styles: { large: '300x300>',
                              medium: '150x150#',
                              thumb: '100x100#' },
                    keep_old_files: true,
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
