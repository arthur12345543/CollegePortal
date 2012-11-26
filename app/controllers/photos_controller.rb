#encoding: utf-8
class PhotosController < ApplicationController
	def index
		
	end

	def new
		@TitleOfPage = "Загрузить новую фотографию"
	end

	def create
		@photo = Photo.create(params[:photos])
		redirect_to albums_path
	end
end
