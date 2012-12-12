class NewsController < ApplicationController
	def index		
		@news = News.order("created_at DESC").paginate(:page => params[:page], :per_page => 20 )
	end
	
	def new
		@TitleOfPage = "New News"
	end

	def create
		@news = News.new(params[:news])
		if @news.save
		  redirect_to news_index_path
		else
		  render :action => :new
		end

	end
	def show
		@News = News.find(params[:id])
	end
	def destroy
	@News = News.find(params[:id])
	@News.destroy
	redirect_to :action => :index
	end
end
