class RolesController < ApplicationController
  def index	
    @Photo1 = Album.all
    if current_user && current_user.role && current_user.role.can_admin_roles 
      @TitleOfPage = "User roles"
      @roles = Role.all
    else
      redirect_to :root
    end
  end
  
  def new
    @Photo1 = Album.all
    @TitleOfPage = "New News"
  end

  def create
    @Photo1 = Album.all
    if current_user && current_user.role && current_user.role.can_admin_roles 
      @role = Role.new(params[:role])
      @role.save
    end
    redirect_to :action => :index
  end

  def destroy
    @Photo1 = Album.all
    if current_user && current_user.role && current_user.role.can_admin_roles 
      @Role = Role.find(params[:id])
      @Role.destroy
    end
    redirect_to :action => :index
  end
end
