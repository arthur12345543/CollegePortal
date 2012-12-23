class UploadsController < ApplicationController
	def index		
	  @uploads = Upload.order("created_at DESC").paginate(:page => params[:page], :per_page => 15 )
	end
	
	def new
	  @TitleOfPage = "New File"
	end

	def create
	  @upload = Upload.create(params[:upload])
	  redirect_to uploads_path
	end
	def destroy
	  @Upload = Upload.find(params[:id])
	  @Upload.destroy
	  redirect_to :action => :index
	end
end
