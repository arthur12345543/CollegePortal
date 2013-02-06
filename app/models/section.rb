class Section < ActiveRecord::Base
  attr_accessible :title
  has_many  :theme
  validates :text, presence: true
end
