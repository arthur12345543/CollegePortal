class News < ActiveRecord::Base

  attr_accessible :picture

  has_attached_file :picture
  
end