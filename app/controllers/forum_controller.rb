#encoding: utf-8
class ForumController < ApplicationController
  def index
    @TitleOfPage = "Форум"
    @sections=Section.all
  end
  def new
    if current_user && current_user.role && current_user.role.can_admin_forum
      @TitleOfPage = "Новый раздел"
    else
      redirect_to root_path
    end
  end
  
  def new_theme
    if current_user && current_user.role && current_user.role.can_post_forum
      @TitleOfPage = "Новая тема"
      @theme=Theme.new  
    else
      redirect_to root_path
    end
  end
end
