class NewsController < ApplicationController
	def index
		@news = News.all
	end
	
	def new
		@TitleOfPage = "New News"
	end

	def create
		@news = News.create(params[:news])
		redirect_to news_index_path
	end
end
