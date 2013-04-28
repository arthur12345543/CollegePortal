#encoding: utf-8

class NewsController < ApplicationController
  
  def index
    @TitleOfPage = "Главная"
    		
    @news = News.order("created_at DESC").paginate(:page => params[:page], :per_page => 10 )
  end	
  
  def new
    @TitleOfPage = "Новая новость"
    @news = News.new
  end

  def create
    
        if current_user && current_user.role && current_user.role.can_add_news
      $news = News.new(params[:news])
      gmail=Gmail.new("ct.test.college@gmail.com","nanam1nanam1")
      if $news.save
	User.all.each do |t|
	
	  gmail.deliver do
	    
	    to t.email
	    subject "Свежие новости из жизни колледжа!"
	    text_part do
	      body "На нашем сайте была опубликована новая новость."
	    end
	    html_part do
	      content_type 'text/html; charset=UTF-8'
	   
	      body ("
		Здравствуйте, "+t.name+' '+t.surname+" . На нашем сайте была опубликована новость: “"+$news.title+"”. <br> Полный текст новости вы можете просмотреть по данному <a href='"+Rails.application.routes.url_helpers.url_for(:host => 'www.ct-college.com.ua',:controller=>:news, :action=>:show, :id=>$news.id)+"'>адресу</a>")
	    end
	  end
	  
	end
	gmail.logout
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
