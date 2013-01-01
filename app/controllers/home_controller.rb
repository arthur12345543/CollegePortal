#encoding: utf-8

class HomeController < ApplicationController
  
  def index
    @TitleOfPage = "Главная"
    @Photo1 = Album.all  
  end

end
