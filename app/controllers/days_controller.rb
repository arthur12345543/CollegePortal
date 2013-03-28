class DaysController < ApplicationController
  def new
    @Photo1 = Album.all
  end

  def create
    @Photo1 = Album.all
    @Day = Day.create(params[:day])
    if @Day.save
      redirect_to new_schedule_path
    end
  end

  def destroy
    @Photo1 = Album.all
    @Day = Day.find(params[:id])
    @Day.destroy
    redirect_to new_schedule_path
  end
end
