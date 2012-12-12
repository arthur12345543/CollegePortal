 class CreateUploads < ActiveRecord::Migration
  def create
    create_table :uploads do |t|
      t.string :title, :maximum=>100
      t.has_attached_file :file
      t.integer :user_id,:maximum=>100
      t.integer :lesson_id,:maximum=>100

      t.timestamps
    end
  end
end
