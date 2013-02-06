class ThemesController < ApplicationController
  def create
      @theme = Theme.new(params[:theme])  
     if @theme.save
        redirect_to forum_path
      else
        render :controller=>"forum", :action => :new_theme
      end
    end
end