class LessonsController < ApplicationController
  def new
    @Photo1 = Album.all
  end

  def create
    @Photo1 = Album.all
    @Lesson = Lesson.create(params[:lesson])
    if @Lesson.save
      redirect_to new_schedule_path
    end
  end

  def destroy
    @Photo1 = Album.all
    @Lesson = Lesson.find(params[:id])
    @Lesson.destroy
    redirect_to new_schedule_path
  end
end
