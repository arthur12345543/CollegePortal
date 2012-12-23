class GroupsController < ApplicationController
  def new

  end

  def create
    @Group = Group.create(params[:group])
    if @Group.save
      redirect_to new_schedule_path
    end
  end

  def destroy
    @Group = Group.find(params[:id])
    @Group.destroy
    redirect_to new_schedule_path
  end
end
