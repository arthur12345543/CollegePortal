class UsersController < ApplicationController
 
  def chenge_private_role
    if current_user && current_user.role && current_user.role.can_admin_roles 
      @user = User.find(params[:id])
      @user.role=Role.find(params[:role_id])
      if @user.save == false
       render :action => :show
      end
      redirect_to users_path
    else
      redirect_to root_path
    end 
  end
  
  def show_all
    @users = User.order("created_at DESC").paginate(:page => params[:page], :per_page => 20 )
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end
