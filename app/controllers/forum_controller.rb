class ForumController < ApplicationController
  def index
    @Photo1 = Album.all
    @TitleOfPage = "Forum"
    @sections=Section.all
  end
  def new
    @Photo1 = Album.all
    @TitleOfPage = "New Section"
  end
  
  def new_theme
    @Photo1 = Album.all
    @TitleOfPage = "New theme"
    @theme=Theme.new  
  end
  

  



end
