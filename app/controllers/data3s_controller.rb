#encoding: utf-8
class Data3sController < ApplicationController
  def index
  	@TitleOfPage = "Замены на завтра"
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
  	@TitleOfPage = "Добавить замену на завтра"
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
    @Data3 = Data3.create(params[:data3])
    if @Data3.save
      redirect_to new_data3_path
    end
  end

  def destroy
  	@Data3 = Data3.find(params[:id])
    @Data3.destroy
    redirect_to data3s_path
  end
end
