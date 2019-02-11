class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :full_name, :email, :password

  has_many :user_plans
  has_many :plans, through: :user_plans
  has_many :channels, through: :plans
  has_many :orders, through: :channels

end
