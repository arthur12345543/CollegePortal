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
    	@TitleOfPage = "Сообщение администрации сайта"
    	@feedback = Feedback.new
    end

    def done
    	@TitleOfPage = "Ваш запрос успешно принят"
    end

    def show_all
    	@TitleOfPage = "Связь с пользователями"
    	@feedbacks = Feedback.all
    end
end



