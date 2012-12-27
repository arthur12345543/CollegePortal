class AddData1sLecturerId < ActiveRecord::Migration
  def up
  	change_table :data1s do |t|
      t.string :lecturer_id
    end
  end

  def down
  end
end
