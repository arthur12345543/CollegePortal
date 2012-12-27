class CreateData1s < ActiveRecord::Migration
  def change
    create_table :data1s do |t|
      t.integer :group_id
      t.integer :day_id
      t.integer :audience_id
      t.integer :lesson_id
      t.integer :number_lesson

      t.timestamps
    end
  end
end
