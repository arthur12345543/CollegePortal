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
    redirect_to albums_path
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to albums_path
  end
end
