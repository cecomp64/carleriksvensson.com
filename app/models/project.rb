class Project < ActiveRecord::Base
  has_many :tags
  has_many :images
  belongs_to  :primary_image, class_name: "Image"
end
