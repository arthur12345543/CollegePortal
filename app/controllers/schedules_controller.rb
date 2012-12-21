#encoding: utf-8
class SchedulesController < ApplicationController
  def index
  	@TitleOfPage = "Расписание"
  end

  def new
  	@TitleOfPage = "Добавить пару"
  end
end
