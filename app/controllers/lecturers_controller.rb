class LecturersController < ApplicationController
  def new

  end

  def create
    @Lecturer = Lecturer.create(params[:lecturer])
    if @Lecturer.save
      redirect_to new_schedule_path
    end
  end

  def destroy
    @Lecturer = Lecturer.find(params[:id])
    @Lecturer.destroy
    redirect_to new_schedule_path
  end
end