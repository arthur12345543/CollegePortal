class CreateFiles < ActiveRecord::Migration
  def change
    create_table :files do |t|
      t.text :link_to_file,:maximum=>100
      t.integer :user_id,:maximum=>100
      t.integer :lesons_id,:maximum=>100

      t.timestamps :maximum=>100
    end
  end
end