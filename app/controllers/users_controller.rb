class UsersController < ApplicationController
 
  
  
  def set_role
    if current_user.userable_type != nil
      redirect_to root_path
    end
  end
  
  def set_student
    if current_user.userable_type != nil
      redirect_to root_path
    else
      @student=Student.new
      @student.save
      @user=current_user
      @user.userable=@student
      @user.save
      redirect_to root_path      
    end
  end
  
  def set_teacher
    if current_user.userable_type != nil
      redirect_to root_path
    else
      @teacher=Teacher.new
      @teacher.save
      @user=current_user
      @user.userable=@teacher
      @user.save
      redirect_to root_path      
    end
  end
  
  def show_all
    @users = User.order("created_at DESC").paginate(:page => params[:page], :per_page => 2 )
  end
  
end
