#encoding: utf-8
class PartnersController < ApplicationController
   def index
    @TitleOfPage = "Партнёры"
    @Partners = Partner.all
  end	
  
  def new
    if current_user && current_user.role && current_user.role.can_edit_partners
      @TitleOfPage = "Добавить партнёра"
      @Partner = Partner.new
    else
      redirect_to partners_path
    end
  end

  def create
    if current_user && current_user.role && current_user.role.can_edit_partners
      @Partner = Partner.new(params[:partner])
      if @Partner.save
        redirect_to partners_path
      else
        render :action => :new
      end
    else
      redirect_to partners_path
    end
  end
  
  def destroy
    if current_user && current_user.role && current_user.role.can_edit_partners
      @Partner = Partner.find(params[:id])
      @Partner.destroy
    else
      redirect_to partners_path
    end
    redirect_to :action => :index
  end
end
