class AddFildsToRole < ActiveRecord::Migration
  def up
  	   change_table:roles do |t|
      t.boolean :can_add_history, :default => true
      t.boolean :can_delete_history, :default => true
      t.boolean :can_post_forum, :default => true
      t.boolean :can_admin_forum, :default => true
      t.boolean :can_manage_albums, :default => true
      t.boolean :can_admin_roles, :default => true
    end
  end

  def down
  end
end
