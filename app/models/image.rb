class Image < ActiveRecord::Base
  has_attached_file :file, :styles => { :icon => "64x64#", :small => "128x128>" }
  validates_attachment_presence :file
  validates_attachment_size :file, :less_than => 5.megabytes
  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png']
end
