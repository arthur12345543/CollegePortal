class Day < ActiveRecord::Base
  attr_accessible :name,:group_id
  belongs_to :group
  has_many :lesson
end
