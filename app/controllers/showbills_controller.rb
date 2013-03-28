class ShowbillsController < ApplicationController
  
  	def index
  	  @Photo1 = Album.all		
      @showbills = Showbills.order("created_at DESC").paginate(:page => params[:page], :per_page => 1 )
	end
	
	def new
	  @Photo1 = Album.all	
	  @TitleOfPage = "New Showbills"
	end

	def create
	  @Photo1 = Album.all
	  @Showbills = Showbills.new(params[:showbills])
	    if @Showbills.save
		  redirect_to showbill_path
		else
		  render :action => :new
		end

	end

	def show
	  @Photo1 = Album.all
	  @Showbills = Showbills.find(params[:id])
	end
	
	def destroy
	  @Photo1 = Album.all
      @Showbills = Showbills.find(params[:id])
      @Showbills.destroy
      redirect_to :action => :index
	end
  
end
