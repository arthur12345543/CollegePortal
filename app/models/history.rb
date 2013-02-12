class History < ActiveRecord::Base
  attr_accessible :title, :text
  has_one :album
end
