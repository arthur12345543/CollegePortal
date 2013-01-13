class RolesController < ApplicationController
  def index	
     @TitleOfPage = "User roles"
    @roles = Role.all
  end
  
  def new
    @TitleOfPage = "New News"
  end

  def create
    @role = Role.new(params[:role])
    @role.save
    redirect_to :action => :index
  end

  def destroy
    @Role = Role.find(params[:id])
    @Role.destroy
    redirect_to :action => :index
  end
end
