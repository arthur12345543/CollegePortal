class AddUserSurname < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string :surname
    end
  end

  def down
  end
end
