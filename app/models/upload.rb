class Upload < ActiveRecord::Base
  attr_accessible :file, :title, :lesons_id, :user_id
  has_attached_file :file

#, :content_type => "archive/*", :size => { :in => 10..100000.kilobytes }
#  validates :title, :presence => true, :length => { :minimum => 5 }
end