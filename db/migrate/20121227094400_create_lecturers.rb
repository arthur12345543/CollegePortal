class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.text :name

      t.timestamps
    end
  end
end
