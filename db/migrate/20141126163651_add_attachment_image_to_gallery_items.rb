class AddAttachmentImageToGalleryItems < ActiveRecord::Migration
  def self.up
    change_table :gallery_items do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :gallery_items, :image
  end
end
