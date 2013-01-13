class ShowbillsController < ApplicationController
  
  	def index		
      @showbills = Showbills.order("created_at DESC").paginate(:page => params[:page], :per_page => 1 )
	end
	
	def new
	  @TitleOfPage = "New Showbills"
	end

	def create
	  @Showbills = Showbills.new(params[:showbills])
	    if @Showbills.save
		  redirect_to showbill_path
		else
		  render :action => :new
		end

	end

	def show
	  @Showbills = Showbills.find(params[:id])
	end
	
	def destroy
      @Showbills = Showbills.find(params[:id])
      @Showbills.destroy
      redirect_to :action => :index
	end
  
end
