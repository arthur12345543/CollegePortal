#encoding: utf-8
class ScheduleController < ApplicationController
  def index
    @TitleOfPage = "Расписание"
    @groups=Group.all
  end
  def edit
    if current_user && current_user.role && current_user.role.can_edit_schedule 
      @TitleOfPage = "Редактирование рсписания"
      @lesson = Lesson.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def add_replacement
    if current_user && current_user.role && current_user.role.can_edit_schedule 
      @TitleOfPage = "Добавление замены"
      @lesson = Lesson.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    if current_user && current_user.role && current_user.role.can_edit_schedule 
      @lesson = Lesson.find(params[:id])
      if @lesson.update_attributes(params[:lesson])
        redirect_to :action => :index
      else
        render :action => :edit
      end
    else
      redirect_to root_path
    end
  end
  def replacement_save
    if current_user && current_user.role && current_user.role.can_edit_schedule 
      @lesson = Lesson.find(params[:id])
      if @lesson.update_attributes(params[:lesson])
        @lesson.replacement_date = Date.current
        @lesson.save
        redirect_to :action => :index
      else
        render :action => :add_replacement
      end
    else
      redirect_to root_path
    end
  end
  def replacement_destroy
    if current_user && current_user.role && current_user.role.can_edit_schedule 
      @lesson = Lesson.find(params[:id])
      if @lesson.update_attributes(params[:lesson])
        @lesson.replacement_date = Date.current-30
        @lesson.save
        redirect_to :action => :index
      else
        render :action => :add_replacement
      end
    else
      render :action => :add_replacement
    end
  end
end
