class User < ActiveRecord::Base
  attr_accessible :ip, :name
  
  has_many :ratings, :dependent => :destroy
  has_many :kudos, :dependent => :destroy

  validates :ip, :presence => true
  validates :name, :length => { :maximum => 80 }, :presence => true
  validates :email, :presence => true, :uniqueness => true, :if => :admin?
  validates :password_digest, :presence => true, :if => :admin?
  validates :role, :numericality => true, :if => :admin?

  require 'bcrypt'
  attr_reader :password
  include ActiveModel::SecurePassword::InstanceMethodsOnActivation

  def admin?
    self.role > 0
  end

  def self.new_guest(ip)
  	new { |u| u.ip = ip }
  end
end
