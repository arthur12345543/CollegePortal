class RolesToUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.integer  :role_id, :default => 1
    end
  end

  def down
  end
end
