class UsersController < ApplicationController
 
  def chenge_private_role
    
    if current_user && current_user.role && current_user.role.can_admin_roles 
      @user = User.find(params[:id])
      @user.role=Role.find(params[:role_id])
      if @user.save == false
       render :action => :show
      end
      redirect_to users_path
    end 
  end

  def edit
    
    @news = News.find(params[:id])
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
