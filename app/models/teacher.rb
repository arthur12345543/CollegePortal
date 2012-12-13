class Teacher < ActiveRecord::Base
  
  has_one :user, :as => :userable
  attr_accessible :group, :lessons, :birthday
end
