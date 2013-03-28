#encoding: utf-8
class PhotosController < ApplicationController
  def index
    
  end

  def new
    
    @album_id = params[:album_id]
    @TitleOfPage = "Загрузить новую фотографию"
  end

  def create
    
    @photo = Photo.create(params[:photo])

    if @photo.save
      redirect_to albums_path
    else
      render :action => :new
    end
    
  end

  def show
    
    @photo = Photo.find(params[:id])
    @TitleOfPage = @photo.description
  end

  def destroy
    
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to albums_path
  end
end
