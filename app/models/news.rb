class News < ActiveRecord::Base
  attr_accessible :picture, :text, :title
  has_attached_file :picture,:styles => { :original => "558x524>", :small => "250x250>"},:content_type => "image/*",
  :size => { :in => 20..20000.kilobytes }
  validates :title, :presence => true
  validates :text, :presence => true
end
