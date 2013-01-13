class CreateRoles < ActiveRecord::Migration
  def up
    create_table:roles do |t|
      t.string  :name
      t.string  :information
      t.boolean :can_add_files, :default => 0
      t.boolean :can_delete_files, :default => 0
      t.boolean :can_add_news, :default => 0
      t.boolean :can_delete_news, :default => 0
    end
  end
  def down
  end
end