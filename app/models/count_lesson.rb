class CountLesson < ActiveRecord::Base
  attr_accessible :count
  
  belongs_to :data
end
