class Country < ActiveRecord::Base
  attr_accessible :name, :code
  
  has_many :providers

  validates :name, :presence => true, :uniqueness => true
  validates :code, :presence => true, :uniqueness => true, :length => { :is => 2 }

  extend FriendlyId
  friendly_id :code
end
