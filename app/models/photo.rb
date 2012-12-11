class Photo < ActiveRecord::Base
  has_attached_file :picture#,:styles => { :original => "558x524>", :small => "150x150>"},:content_type => "image/*",
  #:size => { :in => 20..20000.kilobytes }
  attr_accessible :description, :id_albums, :picture
end
