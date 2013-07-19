require 'faker'
require 'securerandom'

Post.delete_all
Category.delete_all

categories = []

categories << Category.create!(name: "men's swimsuits")
categories << Category.create!(name: "men's speedos")
categories << Category.create!(name: "used bond dvd's")
categories << Category.create!(name: "protein shakes")
categories << Category.create!(name: "range rovers")
categories << Category.create!(name: "daniel craig posters")
categories << Category.create!(name: "daniel craig memorabilia")
categories << Category.create!(name: "slimfast")
categories << Category.create!(name: "maps to daniel craig's home")


def price
  dollars = rand(501)
  cents = rand(100)
  dollars + (cents/100.0)
end

def unique_url
  SecureRandom.hex(4)
end


100.times do
  Post.create!(title: Faker::Lorem.sentence(word_count = 4, supplemental = false),
               description: Faker::Lorem.sentence(word_count = 20, supplemental = false),
               price: price,
               email: Faker::Internet.email,
               category_id: categories.sample.id,
               unique_url: unique_url
                )
end



