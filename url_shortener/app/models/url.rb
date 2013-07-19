require 'securerandom'

class Url < ActiveRecord::Base
  belongs_to :user
  validates :url, :format => { :with => /(\d|[a-zA-Z])+\.([a-zA-Z\.])+/,
      :message => "invalid URL address" }

  before_save :shorten!


  def shorten!
    return if self.shortened_url
    self.shortened_url = SecureRandom.hex(3)
  end

  def count!
    self.click_counter += 1
  end

end

