class RolesEdit < ActiveRecord::Migration
  def up
    @a=Role.new
    @a.name='User'
    @a.information='Defaul user'
    @a.can_add_files = false
    @a.can_delete_files = false
    @a.can_add_news = false
    @a.can_delete_news = false
    @a.can_add_history = false
    @a.can_delete_history = false
    @a.can_admin_forum = false
    @a.can_manage_albums = false
    @a.can_admin_roles = false
    @a.can_post_forum = true
    @a.can_edit_news = true
    @a.save
    
    @b=Role.new
    @b.name='Admin'
    @b.information='defaul admin'
    @b.can_add_files = true
    @b.can_delete_files = true
    @b.can_add_news = true
    @b.can_delete_news = true
    @b.can_add_history = true
    @b.can_delete_history = true
    @b.can_admin_forum = true
    @b.can_manage_albums = true
    @b.can_admin_roles = true
    @b.can_post_forum = true
    @b.can_edit_news = true
    @b.save

    @c=Role.new
    @c.name='Baned'
    @c.information='defaul admin'
    @c.can_add_files = false
    @c.can_delete_files = false
    @c.can_add_news = false
    @c.can_delete_news = false
    @c.can_add_history = false
    @c.can_delete_history = false
    @c.can_admin_forum = false
    @c.can_manage_albums = false
    @c.can_admin_roles = false
    @c.can_post_forum = false
    @c.can_edit_news = false
    @c.save
  end

  def down
  end
end
