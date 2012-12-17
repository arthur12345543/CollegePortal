class Lessons < ActiveRecord::Base
  attr_accessible :tittle
  
  belongs_to :data1
end
