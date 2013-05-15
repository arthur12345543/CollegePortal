#encoding: utf-8
class FeedbacksController < ApplicationController
  def create
  @feedback = Feedback.new(params[:feedback])
    if @feedback.save
      redirect_to :action => :done
    else
      render  :action => :new
    end
  end

  def new
    if current_user && current_user.role && current_user.role.can_admin_feedbacks
      @TitleOfPage = "Сообщение администрации сайта"
      @feedback = Feedback.new
    else
      redirect_to root_path
    end
  end

  def done
   	@TitleOfPage = "Ваш запрос успешно принят"
  end

  def show_all
    if current_user && current_user.role && current_user.role.can_admin_feedbacks
      @TitleOfPage = "Связь с пользователями"
      @feedbacks = Feedback.all
    else
      redirect_to root_path
    end
  end

  def served
    if current_user && current_user.role && current_user.role.can_admin_feedbacks
       @feedback = Feedback.find(params[:id])
       @feedback.served=true
       @feedback.save
       redirect_to :action=>:show_all
    else
      redirect_to root_path
    end
  end
end



