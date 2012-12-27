class Data1sController < ApplicationController
  def new
  end

  def create
    @Data1 = Data1.create(params[:data1])
    if @Data1.save
      redirect_to new_schedule_path
    end
  end

  def destroy
    @Data1 = Data1.find(params[:id])
    @Data1.destroy
    redirect_to new_schedule_path
  end
end
