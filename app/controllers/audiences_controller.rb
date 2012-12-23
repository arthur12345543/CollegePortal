class AudiencesController < ApplicationController
  def new

  end

  def create
    @Audience = Audience.create(params[:audience])
    if @Audience.save
      redirect_to new_schedule_path
    end
  end

  def destroy
    @Audience = Audience.find(params[:id])
    @Audience.destroy
    redirect_to new_schedule_path
  end
end
