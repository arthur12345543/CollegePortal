class DaysController < ApplicationController
  def new

  end

  def create
    @Day = Day.create(params[:title])
    if @Day.save
      redirect_to new_schedule_path
    end
  end

  def destroy
    @Day = Day.find(params[:id])
    @Day.destroy
    redirect_to new_schedule_path
  end
end
