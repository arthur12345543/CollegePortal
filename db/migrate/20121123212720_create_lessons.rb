class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.text :tittle, :maximum=>100

      t.timestamps :maximum=>100
    end
  end
end
