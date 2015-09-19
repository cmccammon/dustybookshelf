class User < ActiveRecord::Base
  has_many :itmes
  has_one :address
  has_many :itmes, through: :orders
end
