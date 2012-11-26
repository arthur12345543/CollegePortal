class Upload < ActiveRecord::Base
  attr_accessible :file, :title, :link_to_file, :lesons_id, :user_id
	has_attached_file :file, :content_type => "archive/zip", :size => { :in => 10..100000.kilobytes }
  validates :title, :presence => true, :length => { :minimum => 5 }

  validates :file, :presence => true  
end
