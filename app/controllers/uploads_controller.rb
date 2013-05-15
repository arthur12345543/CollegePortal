#encoding: utf-8
class UploadsController < ApplicationController
  def index
    @TitleOfPage = "Файловое хранилище"
    @uploads = Upload.order("created_at DESC").paginate(:page => params[:page], :per_page => 15 )
  end
	
  def new
  	if current_user && current_user.role &&  current_user.role.can_add_files
      @TitleOfPage = "Загрузка файла"
    else
      redirect_to root_path
	end
  end

  def create
    if current_user && current_user.role &&  current_user.role.can_add_files
      @upload = Upload.create(params[:upload])
    else
      redirect_to root_path  
    end
	  redirect_to uploads_path
	end

  def destroy	
    if current_user && current_user.role && current_user.role.can_delete_files 
      @Upload = Upload.find(params[:id])
      @Upload.destroy
      redirect_to :action => :index
    else
      redirect_to root_path
    end
  end
end
