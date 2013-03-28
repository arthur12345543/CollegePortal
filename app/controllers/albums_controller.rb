#encoding: utf-8
class AlbumsController < ApplicationController
  def index
  	@TitleOfPage = "Фотогалерея"
  	@albums = Album.order("created_at DESC").paginate(:page => params[:page], :per_page => 10 )
  end

  def new
  	@TitleOfPage = "Создать новый альбом"
  end

  def create
	  @albums = Album.create(params[:album])
    if @albums.save
      redirect_to albums_path
    else
      render :action => :new
    end

  end

  def show
    @albums = Album.find(params[:id])
    @TitleOfPage = @albums.title
  end

  def destroy
    @albums = Album.find(params[:id])
    @albums.destroy
    redirect_to :action => :index
  end
  
end
