class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.date :birthday
       t.string :lessons
      t.timestamps
    end
  end
end
