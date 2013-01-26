class CreateRoles < ActiveRecord::Migration
  def up
    create_table:roles do |t|
      t.string  :name
      t.string  :information
      t.boolean :can_add_files, :default => true
      t.boolean :can_delete_files, :default => true
      t.boolean :can_add_news, :default => true
      t.boolean :can_delete_news, :default => true
      t.boolean :can_add_showbill, :default => true
      t.boolean :can_delete_showbill, :default => true
    end
  end
  def down
  end
end