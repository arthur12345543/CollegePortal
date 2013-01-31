#encoding: utf-8
class Data2sController < ApplicationController
  def index
  	@TitleOfPage = "Замены на сегодня"
    @maxLessons = CountLesson.last
    if @maxLessons.nil?
      @maxLessons = CountLesson.new(:count => 0)
    end
    @allAudience = Audience.all
    @allDay = Day.all
    @allGroup = Group.all
    @allLesson = Lesson.all
    @allLecturer = Lecturer.all
  end

  def new
  	@TitleOfPage = "Добавить замену на сегодня"
  	@maxLessons = CountLesson.last
    if @maxLessons.nil?
      @maxLessons = CountLesson.new(:count => 0)
    end
  	@allAudience = Audience.all
  	@allDay = Day.all
  	@allGroup = Group.all
  	@allLesson = Lesson.all
    @allLecturer = Lecturer.all
  end

  def create
    @Data2 = Data2.create(params[:data2])
    if @Data2.save
      redirect_to new_data2_path
    end
  end

  def destroy
  	@Data2 = Data2.find(params[:id])
    @Data2.destroy
    redirect_to data2s_path
  end
end
