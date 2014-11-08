class Project < ActiveRecord::Base
  has_many :tags
  has_many :images
end
