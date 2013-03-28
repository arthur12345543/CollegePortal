#encoding: utf-8
class Data3Controller < ApplicationController
  def index
  	@Photo1 = Album.all
    @TitleOfPage = "Замены на завтра"
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
