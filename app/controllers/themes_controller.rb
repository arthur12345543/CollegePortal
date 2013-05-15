class ThemesController < ApplicationController
  def create
    
    if current_user && current_user.role && current_user.role.can_admin_forum
      @theme = Theme.new(params[:theme])  
      if @theme.save == false
        render :controller=>"forum", :action => :new_theme
      end
      redirect_to forum_path
    else
      redirect_to root_path
    end
  end

    
def destroy
  
  if current_user && current_user.role && current_user.role.can_admin_forum
    @Theme = Theme.find(params[:id])
    @Theme.post.each do|t|
      t.destroy
    end
    @Theme.destroy
  else
    redirect_to root_path
  end
    redirect_to forum_path
end
end