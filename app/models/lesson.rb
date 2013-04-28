class Lesson < ActiveRecord::Base
   attr_accessible :replacement_teacher, :body, :even_room, :even_lesson, :even_teacher, :odd_room, :odd_lesson, :odd_teacher, :replacement_room, :replacement_lesson,  :replacement_date, :double_lesson, :day_id
   
   belongs_to :day
end
