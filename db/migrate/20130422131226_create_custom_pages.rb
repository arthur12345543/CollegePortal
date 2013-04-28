#encoding: utf-8
class CreateCustomPages < ActiveRecord::Migration
  def change
    create_table :custom_pages do |t|
      t.string :name
      t.text :html_code
      t.timestamps
    end
    CustomPage.create(:name => "О колледже")
    CustomPage.create(:name => "История")
    CustomPage.create(:name => "Цели и задачи")
    CustomPage.create(:name => "Руководство")
    CustomPage.create(:name => "Преподовательский состав")
    CustomPage.create(:name => "Перечень специальностей")
    CustomPage.create(:name => "Краткое описание дисциплин")
    CustomPage.create(:name => "Практика студентов")
    CustomPage.create(:name => "Общежития")
    CustomPage.create(:name => "Профком")
    CustomPage.create(:name => "Абитуриенту")
    CustomPage.create(:name => "Правила приёма")
    CustomPage.create(:name => "Приёмная комиссия")
    CustomPage.create(:name => "Документы")
    CustomPage.create(:name => "Оформить заявление")
  end
end
