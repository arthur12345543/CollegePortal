class Post < ActiveRecord::Base
  attr_accessible :user_id, :text, :theme_id
  belongs_to :theme
  belongs_to :user
  
  validates :text, presence: true
  validates :user_id, presence: true
end
