#encoding: utf-8
class ScheduleController < ApplicationController
  def index
    @TitleOfPage = "Расписание"
    @groups=Group.all
  end
  def edit
    @TitleOfPage = "Редактирование рсписания"
    @lesson = Lesson.find(params[:id])
  end
  def add_replacement
    @TitleOfPage = "Добавление замены"
    @lesson = Lesson.find(params[:id])
  end
  def update
      @lesson = Lesson.find(params[:id])
      if @lesson.update_attributes(params[:lesson])
      redirect_to :action => :index
      else
      render :action => :edit
    end
  end
  def replacement_save
      @lesson = Lesson.find(params[:id])
      if @lesson.update_attributes(params[:lesson])
      @lesson.replacement_date = Date.current
      @lesson.save
      redirect_to :action => :index
      else
      render :action => :add_replacement
    end
  end
end
