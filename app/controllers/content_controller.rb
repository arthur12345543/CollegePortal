#encoding: utf-8
class ContentController < ApplicationController
  def index
    @Content = CustomPage.find(params[:id])
    @TitleOfPage = @Content.name
  end
  
   def update
    if current_user && current_user.role && current_user.role.can_edit_custom_pages
      @CustomPage = CustomPage.find(params[:id])
      if @CustomPage.update_attributes(params[:custom_page])
        redirect_to :action => :show, :id => @CustomPage.id
      else
        render :action => :edit
      end
    else
      redirect_to admin_path   
    end
  end
  
  def edit
    if current_user && current_user.role && current_user.role.can_edit_custom_pages
      @TitleOfPage = "Редактирование страницы"
      @CustomPage= CustomPage.find(params[:id])
    else
      redirect_to admin_path   
    end
  end
end
