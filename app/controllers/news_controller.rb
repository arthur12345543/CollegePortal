class NewsController < ApplicationController
  def index		
    @news = News.order("created_at DESC").paginate(:page => params[:page], :per_page => 1 )
  end	
  
  def new
    @TitleOfPage = "New News"
  end

  def create
    if current_user && current_user.role && current_user.role.can_delete_news
      @news = News.new(params[:news])
      if @news.save
        redirect_to news_index_path
      else
        render :action => :new
      end
    else
      redirect_to news_index_path
    end
  end

  def show 
    @News = News.find(params[:id])
  end
  
  def destroy
    if current_user && current_user.role && current_user.role.can_delete_news
      @News = News.find(params[:id])
      @News.destroy
    end
    redirect_to :action => :index
  end
end
