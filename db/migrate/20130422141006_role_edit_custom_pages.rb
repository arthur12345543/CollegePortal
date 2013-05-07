class RoleEditCustomPages < ActiveRecord::Migration
  def up
    change_table:roles do |t|
      t.boolean :can_edit_custom_pages, :default => false
    end
  end

  def down
  end
end
