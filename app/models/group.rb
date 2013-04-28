class Group < ActiveRecord::Base
  attr_accessible :title
  has_many :day
  validates :title, presence: true
end
