class CreateData2s < ActiveRecord::Migration
  def change
    create_table :data2s do |t|
      t.integer :day_id
      t.integer :number_lesson
      t.integer :group_id
      t.integer :lesson_id
      t.integer :lecture_id
      t.integer :audience_id

      t.timestamps
    end
  end
end
