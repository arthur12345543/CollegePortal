class AddUserableColumnToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  	  t.references :userable, :polymorphic => true
  	end
  end
end
