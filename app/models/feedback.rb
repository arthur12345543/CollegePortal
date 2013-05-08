class Feedback < ActiveRecord::Base

  attr_accessible :email, :name_surname, :message
  validates :email, presence: true
  validates :name_surname, presence: true
  validates :message, presence: true

  # attr_accessible :title, :body
end
