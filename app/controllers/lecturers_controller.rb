class LecturersController < ApplicationController
  def new
    @Photo1 = Album.all
  end

  def create
    @Photo1 = Album.all
    @Lecturer = Lecturer.create(params[:lecturer])
    if @Lecturer.save
      redirect_to new_schedule_path
    end
  end

  def destroy
    @Photo1 = Album.all
    @Lecturer = Lecturer.find(params[:id])
    @Lecturer.destroy
    redirect_to new_schedule_path
  end
end