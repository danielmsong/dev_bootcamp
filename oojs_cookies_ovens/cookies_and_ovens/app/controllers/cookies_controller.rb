class CookiesController < ApplicationController

  def save 
    cookie_stats = params[:cookie] # some kind of json??
    puts 'huh??'
    p cookie_stats
    redis = Redis.new(:port => 3000)
    # cookie = Redis.set()
  end

end
