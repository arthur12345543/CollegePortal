class CreateShowbill < ActiveRecord::Migration
  def change
    create_table :showbill do |t|

     t.has_attached_file :picture
  		t.timestamps
    end
  end
end
