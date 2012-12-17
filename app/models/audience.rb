class Audience < ActiveRecord::Base
  attr_accessible :title
  
  belongs_to :data
end
