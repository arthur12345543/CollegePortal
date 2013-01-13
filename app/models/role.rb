class Role < ActiveRecord::Base
  attr_accessible :name, :information, :can_add_files,  :can_delete_files,  :can_add_news,  :can_delete_news, :role_id
  validates :name, presence: true
end
