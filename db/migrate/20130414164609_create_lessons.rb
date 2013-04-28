class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.text :even_room, :default => ""
      t.text :even_lesson, :default => ""
      t.text :even_teacher, :default => ""
      
      t.text :odd_room, :default => ""
      t.text :odd_lesson, :default => ""
      t.text :odd_teacher, :default => ""
      
      t.text :replacement_room, :default => ""
      t.text :replacement_lesson, :default => ""
      t.text :replacement_teacher, :default => ""
      t.date :replacement_date, :default => DateTime.civil(2000, 1, 1)
      
      t.boolean :double_lesson, :default => false
      t.integer :day_id

      t.timestamps
    end
  end
end
