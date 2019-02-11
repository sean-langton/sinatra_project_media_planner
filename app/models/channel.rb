class Channel < ActiveRecord::Base

  belongs_to :plans
  has_many :orders

end
