class Album < ActiveRecord::Base
  attr_accessible :title, :user_id

  validates :title, :presence => true,
                    :length => { :minimum => 3 }

  has_many :photos
end
