#encoding: utf-8
class AlbumsController < ApplicationController
  def index
    @Photo1 = Album.all
  	@TitleOfPage = "Фотогалерея"
  	@albums = Album.order("created_at DESC").paginate(:page => params[:page], :per_page => 10 )
  end

  def new
    @Photo1 = Album.all
  	@TitleOfPage = "Создать новый альбом"
  end

  def create
    @Photo1 = Album.all
	  @albums = Album.create(params[:album])

    if @albums.save
      redirect_to albums_path
    else
      render :action => :new
    end

  end

  def show
    @Photo1 = Album.all
    @albums = Album.find(params[:id])
    @TitleOfPage = @albums.title
  end

  def destroy
    @Photo1 = Album.all
    @albums = Album.find(params[:id])
    @albums.destroy
    redirect_to :action => :index
  end
  
end
