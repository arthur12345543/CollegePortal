class Role < ActiveRecord::Base
  attr_accessible :name, :information, :can_add_files,  :can_delete_files,  :can_add_news, :can_edit_news,  :can_delete_news,  :can_add_showbill,  :can_delete_showbill, :role_id, :can_add_history, :can_delete_history, :can_post_forum, :can_admin_forum, :can_manage_albums, :can_admin_roles, :can_edit_schedule, :can_edit_custom_pages, :can_edit_partners
  validates :name, presence: true
end

