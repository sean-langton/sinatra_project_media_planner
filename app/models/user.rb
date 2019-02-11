class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :email, :password

  has_many :user_plans
  has_many :plans, through: :user_plans
  has_many :channels, through: :plans
  has_many :orders, through: :channels

  def slug
     self.username.downcase.gsub(" ", "-")
   end

   def self.find_by_slug(slug)
     User.all.find do |user|
       user.slug == slug
     end
   end

end
