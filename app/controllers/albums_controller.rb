#encoding: utf-8
class AlbumsController < ApplicationController
  def index
  	@TitleOfPage = "Фотогалерея"
  	@albums = Album.all
  end

  def new
  	@TitleOfPage = "Создать новый альбом"
  end

  def create
	  @news = Album.create(params[:album])
	  redirect_to albums_path
  end
end
