class Section < ActiveRecord::Base
  attr_accessible :title
  has_many  :theme
  validates :title, presence: true
end
