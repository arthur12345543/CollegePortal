class RolesToUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.integer  :role_id
    end
  end

  def down
  end
end
