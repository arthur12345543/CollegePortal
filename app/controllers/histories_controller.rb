#encoding: utf-8
class HistoriesController < ApplicationController
  def index
    
    @TitleOfPage = "Абитуриентам"
    @histories = History.all

  end
    
    
  def create
    
    if current_user && current_user.role &&  current_user.role.can_add_history
     @histories = History.new(params[:history])
      if @histories.save==false
        render :action => :new
      end
    end

       
    
        redirect_to :action => :index
  end
    
  def show
    
    @history = History.find(params[:id])
  end
    
def first
      
end

def second
      
end

def destroy
    
    if current_user && current_user.role &&  current_user.role.can_delete_history
      @history = History.find(params[:id])
      @history.destroy
    end
  redirect_to :action => :index

end

  end


