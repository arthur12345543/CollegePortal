class Feedback < ActiveRecord::Migration
  def up
  	 create_table :feedbacks do |t|
      t.string  :email, :null => false
      t.string  :name_surname, :null => false
      t.text  :message, :null => false
      t.timestamps
    end
  end

  def down
  end
end
