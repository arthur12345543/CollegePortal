class NewsController < ApplicationController
  def index
    @Photo1 = Album.all		
    @news = News.order("created_at DESC").paginate(:page => params[:page], :per_page => 10 )
  end	
  
  def new
    @Photo1 = Album.all
    @TitleOfPage = "New News"
    @news = News.new
  end

  def create
    @Photo1 = Album.all
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
  
  def update
    @Photo1 = Album.all
    if current_user && current_user.role && current_user.role.can_edit_news
      @news = News.find(params[:id])
      if @news.update_attributes(params[:news])
        redirect_to :action => :show, :id => @news.id
      else
        render :action => :edit
      end
    else
      redirect_to news_index_path   
    end
  end
  
  def show
    @Photo1 = Album.all 
    @News = News.find(params[:id])
  end
  
   def edit
    @Photo1 = Album.all 
    @news = News.find(params[:id])
  end
  
  def destroy
    @Photo1 = Album.all
    if current_user && current_user.role && current_user.role.can_delete_news
      @News = News.find(params[:id])
      @News.destroy
    end
    redirect_to :action => :index
  end
end
