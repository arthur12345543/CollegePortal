class AddData1sFlasher < ActiveRecord::Migration
  def up
  	change_table :data1s do |t|
      t.string :flasher
    end
  end

  def down
  end
end
