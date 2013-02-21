#encoding: utf-8
class ManualsController < ApplicationController
  def index
    @TitleOfPage = "Информация для абитуриента"
    @manuals = Manual.all

  end

  def new

  end

  def show
    @manuals = Manual.find(params[:id])

  end

  def destroy

  end

  def create
    @manuals = Manual.new(params[:manual])
      if @manuals.save
        redirect_to :action => :index
      else
        render :action => :new
      end
    

  end

end
