class GroupsController < ApplicationController
  def new
    @Photo1 = Album.all
  end

  def create
    @Photo1 = Album.all
    @Group = Group.create(params[:group])
    if @Group.save
      redirect_to new_schedule_path
    end
  end

  def destroy
    @Photo1 = Album.all
    @Group = Group.find(params[:id])
    @Group.destroy
    redirect_to new_schedule_path
  end
end
