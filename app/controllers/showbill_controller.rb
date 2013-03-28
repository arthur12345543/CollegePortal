class ShowbillController < ApplicationController
   def index
    @Photo1 = Album.all		
    @showbill = Showbill.order("created_at DESC").paginate(:page => params[:page], :per_page => 1 )
  end	
  
  def new
    @Photo1 = Album.all
    @TitleOfPage = "New Showbill"
  end

  def create
    @Photo1 = Album.all
    if current_user && current_user.role && current_user.role.can_delete_showbill
      @showbill = Showbill.new(params[:showbill])
      if @showbill.save
        redirect_to showbill_index_path
      else
        render :action => :new
      end
    else
      redirect_to showbill_index_path
    end
  end

  def show 
    @Photo1 = Album.all
    @Showbill = Showbill.find(params[:id])
  end
  
  def destroy
    @Photo1 = Album.all
    if current_user && current_user.role && current_user.role.can_delete_showbill
      @Showbill = Showbill.find(params[:id])
      @Showbill.destroy
    end
    redirect_to :action => :index
  end
end
