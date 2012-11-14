class AddUserInfo < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string :name
      t.integer :status
      t.string :phone
      t.string :country
      t.string :city
      t.string :about
    end
  end

  def down
  end
end 
