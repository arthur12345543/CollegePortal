#encoding: utf-8
class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.text :name
      t.integer :group_id
      t.timestamps
    end
  end
end
