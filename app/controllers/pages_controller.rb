class PagesController < ApplicationController
  def home
    @TitleOfPage = "Главная";  
  end

  def news
    @TitleOfPage = "Новости";
  end

  def showbill
    @TitleOfPage = "Афиша";
  end

  def forum
    @TitleOfPage = "Форум";
  end

  def fotogalerely
    @TitleOfPage = "Фотогалерея";
  end

  def toabiturince
    @TitleOfPage = "Абитуриентам";
  end

  def filestorage
    @TitleOfPage = "Файловое хранилище";
  end
end
