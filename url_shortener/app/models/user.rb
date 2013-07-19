class User < ActiveRecord::Base

  has_many :urls

  validates_uniqueness_of :email

end
