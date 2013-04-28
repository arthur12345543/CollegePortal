class SectionsController < ApplicationController
     def create
      
      if current_user && current_user.role && current_user.role.can_admin_forum
        @section = Section.new(params[:section])
        if @section.save == false
          render :action => :new
        end
      end
      redirect_to forum_path
      end


  def destroy
    
    if current_user && current_user.role && current_user.role.can_admin_forum
      @Section = Section.find(params[:id])
      @Section.theme.each do|n|
      n.post.each do|t|
        t.destroy
      end
     n.destroy
    end
    @Section.destroy
  end
    redirect_to forum_path
 end
 end