class Lecturer < ActiveRecord::Base
  attr_accessible :name

  belongs_to :data1
end
