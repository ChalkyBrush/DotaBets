class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  validates_presence_of :first_name, :last_name, :email, :password, :on => :create
  validates_uniqueness_of(:email)

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  has_many :projects
  has_many :pledges
end
