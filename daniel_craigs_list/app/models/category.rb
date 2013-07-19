class Category < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts, :dependent => :destroy
  @@array_of_names = []

  #class method that populates a list
  def self.get_names
    @@array_of_names = []
    self.all.each { |category| @@array_of_names << category.name }
    @@array_of_names
  end

  def self.get_category(object)
    object.id
  end
end
