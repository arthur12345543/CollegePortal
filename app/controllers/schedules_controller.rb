#encoding: utf-8
class SchedulesController < ApplicationController
  def index
  	@TitleOfPage = "Расписание"
  end

  def new
  	@TitleOfPage = "Добавить пару"
  	@maxLessons = CountLesson.last
  	@allAudience = Audience.all
  	@allDay = Day.all
  	@allGroup = Group.all
  	@allLesson = Lesson.all
    @allTeacher = Teacher.all
    @allLecturer = Lecturer.all
  end
end
