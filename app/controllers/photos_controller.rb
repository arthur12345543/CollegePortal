#encoding: utf-8
class PhotosController < ApplicationController
  def index
    @Photo1 = Album.all
  end

  def new
    @Photo1 = Album.all
    @album_id = params[:album_id]
    @TitleOfPage = "Загрузить новую фотографию"
  end

  def create
    @Photo1 = Album.all
    @photo = Photo.create(params[:photo])

    if @photo.save
      redirect_to albums_path
    else
      render :action => :new
    end
    
  end

  def show
    @Photo1 = Album.all
    @photo = Photo.find(params[:id])
    @TitleOfPage = @photo.description
  end

  def destroy
    @Photo1 = Album.all
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to albums_path
  end
end
