class Data1 < ActiveRecord::Base
  attr_accessible :audience_id, :day_id, :group_id, 
                  :lesson_id, :number_lesson, :flasher, :lecturer_id
  
  has_many :days
  has_many :groups
  has_many :audiences
  has_many :lessons
  has_many :lecturers
end
