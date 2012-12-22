class CreateShowbills < ActiveRecord::Migration
   def change
  	create_table :news do |t|
  		t.has_attached_file :picture
  		t.timestamps
  	end
  end d
end
