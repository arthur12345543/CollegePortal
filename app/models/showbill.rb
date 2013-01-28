class Showbill < ActiveRecord::Base
    attr_accessible :picture, :text, :title
  has_attached_file :picture,:styles => { :original => "558x524>", :small => "150x150>"},:content_type => "image/*",
  :size => { :in => 20..20000.kilobytes }
  validates :title, :presence => true
  validates :text, :presence => true
end
