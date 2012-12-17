class Group < ActiveRecord::Base
  attr_accessible :title
  
  belongs_to :data1
end
