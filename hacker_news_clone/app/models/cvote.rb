class Cvote < ActiveRecord::Base
  belongs_to :comment
  # Remember to create a migration!
end
