class Theme < ActiveRecord::Base
  attr_accessible :title, :section_id
  has_many :post
  belongs_to :section
  validates :title, presence: true

end
