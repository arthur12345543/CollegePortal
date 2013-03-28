#encoding: utf-8
class ManualsController < ApplicationController
  def index
    @Photo1 = Album.all
    @TitleOfPage = "Информация для абитуриента"
    @manuals = Manual.all

  end

  def new
    @Photo1 = Album.all 
  end

  def show
    @Photo1 = Album.all
    @manuals = Manual.find(params[:id])

  end

  def destroy
    @Photo1 = Album.all
  end

  def create
    @Photo1 = Album.all
    @manuals = Manual.new(params[:manual])
      if @manuals.save
        redirect_to :action => :index
      else
        render :action => :new
      end
    

  end

end
