class AddAttachmentImageToHotels < ActiveRecord::Migration
  def self.up
    change_table :hotels do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :hotels, :image
  end
end
