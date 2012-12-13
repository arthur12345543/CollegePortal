class Student < ActiveRecord::Base

  has_one :user, :as => :userable
  attr_accessible :group
end