class CountLessonsController < ApplicationController
  def new
    @Photo1 = Album.all
  end

  def create
    @Photo1 = Album.all
    @CountLesson = CountLesson.create(params[:count_lesson])
    if @CountLesson.save
      redirect_to new_schedule_path
    end
  end

  def destroy
    @Photo1 = Album.all
    @CountLesson = CountLesson.find(params[:id])
    @CountLesson.destroy
    redirect_to new_schedule_path
  end
end
