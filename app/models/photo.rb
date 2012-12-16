class Photo < ActiveRecord::Base
  has_attached_file :picture, :styles => { :original => "558x524>", :small => "150x150>"},:content_type => "image/*",
  :size => { :in => 20..20000.kilobytes }
  
  attr_accessible :description, :album_id, :picture

  validates :description, :presence => true,
                    :length => { :minimum => 3 }

  belongs_to :album
end
