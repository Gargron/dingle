class User < ActiveRecord::Base
  attr_accessible :ip, :name
  has_many :ratings
  has_many :kudos

  validates :ip, :presence => true
  validates :name, :length => { :maximum => 80 }

  def self.new_guest(ip)
  	new { |u| u.ip = ip }
  end
end
