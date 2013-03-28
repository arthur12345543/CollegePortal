#encoding: utf-8
class ContactsController < ApplicationController
  def index
  	@Photo1 = Album.all
  	@TitleOfPage = "Контакты"
  end
end
