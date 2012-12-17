class CreateCountLessons < ActiveRecord::Migration
  def change
    create_table :count_lessons do |t|
      t.integer :count

      t.timestamps
    end
  end
end
