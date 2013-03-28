class Data1sController < ApplicationController
  def new
    @Photo1 = Album.all
  end

  def create
    @Photo1 = Album.all
    @Data1 = Data1.create(params[:data1])
    if @Data1.save
      redirect_to new_schedule_path
    end
  end

  def destroy
    @Photo1 = Album.all
    @Data1 = Data1.find(params[:id])
    @Data1.destroy
    redirect_to schedules_path
  end
end
