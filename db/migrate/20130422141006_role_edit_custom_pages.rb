class RoleEditCustomPages < ActiveRecord::Migration
  def up
    change_table:roles do |t|
      t.boolean :can_edit_custom_pages, :default => false
    end
    @a=Role.find(2)
    @a.can_edit_custom_pages=true
    @a.save
  end

  def down
  end
end
