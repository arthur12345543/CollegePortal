class SectionsController < ApplicationController
     def create
      @section = Section.new(params[:section])
      if @section.save
        redirect_to forum_path
      else
        render :action => :new
      end

end
  def destroy
    @Section = Section.find(params[:id])
    @Section.theme.each do|n|
      n.post.each do|t|
        t.destroy
      end
     n.destroy
    end
    @Section.destroy
    redirect_to forum_path
  end
      end