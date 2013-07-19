class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :pvotes

  validates :title, :content, :presence => true
end
