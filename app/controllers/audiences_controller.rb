class AudiencesController < ApplicationController
  def new
    @Photo1 = Album.all
  end

  def create
    @Photo1 = Album.all
    @Audience = Audience.create(params[:audience])
    if @Audience.save
      redirect_to new_schedule_path
    end
  end

  def destroy
    @Photo1 = Album.all
    @Audience = Audience.find(params[:id])
    @Audience.destroy
    redirect_to new_schedule_path
  end
end
