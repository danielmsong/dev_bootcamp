class Post < ActiveRecord::Base
  attr_accessible :category_id, :description, :email, :price, :title, :unique_url
  belongs_to :category
end
