class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user
  after_save :update_users_karma_point_count


  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  def update_users_karma_point_count
    self.user.update_count(self.value)
  end
end
