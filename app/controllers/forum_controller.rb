#encoding: utf-8
class ForumController < ApplicationController
  def index
    @TitleOfPage = "Форум"
    @sections=Section.all
  end
  def new
    @TitleOfPage = "Новый раздел"
  end
  
  def new_theme
    @TitleOfPage = "Новая тема"
    @theme=Theme.new  
  end
  

  



end
