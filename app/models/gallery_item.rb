class GalleryItem < ActiveRecord::Base
  has_attached_file :image, :styles => { :icon => "64x64#", :tile1 => "128x128>", :tile2 => "320x240>" }
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
end
