class UploadsController < ApplicationController
	def index		
	  @uploads = Upload.order("created_at DESC").paginate(:page => params[:page], :per_page => 15 )
	  @Photo1 = Album.all
	end
	
	def new
	  @TitleOfPage = "New File"
	  @Photo1 = Album.all
	end

	def create
		@Photo1 = Album.all
	    if current_user && current_user.role &&  current_user.role.can_add_files
	      @upload = Upload.create(params[:upload])
	    end
	    redirect_to uploads_path
	end
	def destroy
		@Photo1 = Album.all
	  if current_user && current_user.role && current_user.role.can_delete_files 
	    @Upload = Upload.find(params[:id])
	    @Upload.destroy
	    redirect_to :action => :index
	  end
	end
end
