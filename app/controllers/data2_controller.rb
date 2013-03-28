#encoding: utf-8
class Data2Controller < ApplicationController
  def index
  	@Photo1 = Album.all
  	@TitleOfPage = "Замены на сегодня"
  end

  def new
  	@Photo1 = Album.all
  end

  def create
  	@Photo1 = Album.all
  end

  def destroy
  	@Photo1 = Album.all
  end
end
