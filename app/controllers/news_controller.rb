#encoding: utf-8
class NewsController < ApplicationController
  def index
    @TitleOfPage = "Новости"
    		
    @news = News.order("created_at DESC").paginate(:page => params[:page], :per_page => 10 )
  end	
  
  def new
    @TitleOfPage = "Новая новость"
    
    @TitleOfPage = "New News"
    @news = News.new
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
  
  def update
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
    @News = News.find(params[:id])
    @TitleOfPage = @News.title
  end
  
   def edit
    @TitleOfPage = "Редактирование новости"
    @news = News.find(params[:id])
  end
  
  def destroy
    if current_user && current_user.role && current_user.role.can_delete_news
      @News = News.find(params[:id])
      @News.destroy
    end
    redirect_to :action => :index
  end
end
