class HistoriesController < ApplicationController
  def index
    @TitleOfPage = "history"
    @histories = History.all

  end
    
  def new

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

  end

end
