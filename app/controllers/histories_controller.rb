class HistoriesController < ApplicationController
  def index
    @TitleOfPage = "history"
    @histories = History.all

  end
    
    
  def create
     @histories = History.new(params[:history])
      if @histories.save
        redirect_to :action => :index
      else
        render :action => :new
      end
    

  end
    
  def show
        @history = History.find(params[:id])


  end
    
  def destroy
    @history = History.find(params[:id])
    @history.destroy
 
  redirect_to :action => :index

end

  end


