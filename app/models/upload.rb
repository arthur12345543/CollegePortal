class Upload < ActiveRecord::Base
  attr_accessible :file, :title
  has_attached_file :file, :content_type => "*/*", :size => { :in => 1000000.kilobytes }
  validates :file, :presence => true
end
