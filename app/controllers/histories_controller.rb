class HistoriesController < ApplicationController
  def index
    @Photo1 = Album.all
    @TitleOfPage = "history"
    @histories = History.all

  end
    
    
  def create
    @Photo1 = Album.all
    if current_user && current_user.role &&  current_user.role.can_add_history
     @histories = History.new(params[:history])
      if @histories.save==false
        render :action => :new
      end
    end

       
    
        redirect_to :action => :index
  end
    
  def show
    @Photo1 = Album.all
    @history = History.find(params[:id])
  end
    
def destroy
    @Photo1 = Album.all
    if current_user && current_user.role &&  current_user.role.can_delete_history
      @history = History.find(params[:id])
      @history.destroy
    end
  redirect_to :action => :index

end

  end


