class User < ActiveRecord::Base
  has_many :karma_points
  attr_accessible :first_name, :last_name, :email, :username, :karma_points_count

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}
  scope :page, lambda { |p| limit(18).offset((p - 1) * 18)}

  def self.by_karma
    order('karma_points_count DESC')
  end

  def total_karma
    self.karma_points_count
  end

  def update_count(value)
    self.karma_points_count += value
    self.save
  end


  def full_name
    "#{first_name} #{last_name}"
  end
end

