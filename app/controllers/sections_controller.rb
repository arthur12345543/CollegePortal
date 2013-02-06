class SectionsController < ApplicationController
     def create
      @section = Section.new(params[:section])
      if @section.save
        redirect_to forum_path
      else
        render :action => :new
      end
    end
end
