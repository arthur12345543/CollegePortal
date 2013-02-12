class ThemesController < ApplicationController
  def create
      @theme = Theme.new(params[:theme])  
     if @theme.save
        redirect_to forum_path
      else
        render :controller=>"forum", :action => :new_theme
      end
    end
    
  def destroy
    @Theme = Theme.find(params[:id])
    @Theme.post.each do|t|
      t.destroy
    end
    @Theme.destroy
    redirect_to forum_path
  end
end