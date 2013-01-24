class UsersController < ApplicationController
 
   def chenge_private_role
  
    @user = User.find(params[:id])
     @user.role=Role.find(params[:role_id])
  if @user.save
      redirect_to users_path
    else
    render :action => :show
    end
  end

  
  def select_role
    if current_user.userable_type != nil
      redirect_to root_path
    end
  end
  
  def set_role
    if current_user.userable_type != nil
      redirect_to root_path
    else
      if params[:id]==1
	@role = Student.new
      else 
	@role = Teacher.new
      end
      @role.save
      @user = current_user
      @user.userable=@role
      @user.save
      redirect_to root_path      
    end
  end
  

  
  def show_all
    @users = User.order("created_at DESC").paginate(:page => params[:page], :per_page => 2 )
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end
