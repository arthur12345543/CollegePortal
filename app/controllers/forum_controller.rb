class ForumController < ApplicationController
  def index
    @TitleOfPage = "Forum"
    @sections=Section.all
  end
  def new
    @TitleOfPage = "New Section"
  end
  
  def new_theme
    @TitleOfPage = "New theme"
    @theme=Theme.new  
  end
  

  



end
