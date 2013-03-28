class CountLessonsController < ApplicationController
  def new
  end

  def create
    @CountLesson = CountLesson.create(params[:count_lesson])
    if @CountLesson.save
      redirect_to new_schedule_path
    end
  end

  def destroy
    @CountLesson = CountLesson.find(params[:id])
    @CountLesson.destroy
    redirect_to new_schedule_path
  end
end
