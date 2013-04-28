class DefoultRolesAdding < ActiveRecord::Migration
  def up
    
    Role.create(
    :name=>'User',
    :information => 'defoult user',
    :can_add_files => false,
    :can_add_files => false,
    :can_delete_files => false,
    :can_add_news => false,
    :can_delete_news => false,
    :can_add_history => false,
    :can_delete_history => false,
    :can_admin_forum => false,
    :can_manage_albums => false,
    :can_admin_roles => false,
    :can_post_forum => true,
    :can_edit_news => true,)
    
    
    
    
    Role.create(
    :name=>'Admin',
    :information=>'defoult admin',
    :can_add_files => true,
    :can_delete_files => true,
    :can_add_news => true,
    :can_delete_news => true,
    :can_add_history => true,
    :can_delete_history => true,
    :can_admin_forum => true,
    :can_manage_albums => true,
    :can_admin_roles => true,
    :can_post_forum => true,
    :can_edit_news => true,
    :can_edit_schedule => true,
    )

    Role.create(
    :name=>'Baned',
    :information=>'defoult baned',
    :can_add_files => false,
    :can_delete_files => false,
    :can_add_news => false,
    :can_delete_news => false,
    :can_add_history => false,
    :can_delete_history => false,
    :can_admin_forum => false,
    :can_manage_albums => false,
    :can_admin_roles => false,
    :can_post_forum => false,
    :can_edit_news => false,
    )
  end

  def down
  end
end
