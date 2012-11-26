 class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.text :title, :maximum=>100
      t.has_attached_file :file
      t.integer :user_id,:maximum=>100
      t.integer :lesson_id,:maximum=>100

      t.timestamps
    end
  end
end
