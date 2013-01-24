class UserAdminAndBunDefoultAdding < ActiveRecord::Migration
  def up
    @a=Role.new
    @a.name='User'
    @a.information='defaul user'
    @a.can_add_files = false
    @a.can_delete_files = false
    @a.can_add_news = false
    @a.can_delete_news = false
    @a.save
    
    @b=Role.new
    @b.name='Admin'
    @b.information='defaul admin'
    @b.can_add_files = true
    @b.can_delete_files = true
    @b.can_add_news = true
    @b.can_delete_news = true
    @b.save
  end

  def down
  end
end
