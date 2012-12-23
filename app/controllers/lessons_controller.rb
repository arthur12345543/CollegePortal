class LessonsController < ApplicationController
  def new

  end

  def create
    @Lesson = Lesson.create(params[:lesson])
    if @Lesson.save
      redirect_to new_schedule_path
    end
  end

  def destroy
    @Lesson = Lesson.find(params[:id])
    @Lesson.destroy
    redirect_to new_schedule_path
  end
end
