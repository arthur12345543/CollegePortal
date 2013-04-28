class Partner < ActiveRecord::Base
  # attr_accessible :title, :body\
  attr_accessible :picture, :text, :name
  has_attached_file :picture,:styles => {:original => "150x150>"},:content_type => "image/*",
  :size => { :in => 20..20000.kilobytes }
  validates :name, :presence => true
  validates :text, :presence => true
  validates :picture, :presence => true
end
