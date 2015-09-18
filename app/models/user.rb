class User < ActiveRecord::Base
  has_many :itmes through: :orders

end
