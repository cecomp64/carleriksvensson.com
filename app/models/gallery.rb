class Gallery < ActiveRecord::Base
  has_many :gallery_items
  has_one :cover, -> {where cover: true}, class_name: "GalleryItem"
end
