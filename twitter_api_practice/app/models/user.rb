class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def fetch_tweets!
    tweets = Twitter.user_timeline(self.username)
    tweets.each do |tweet|
      self.tweets.create(:tweet => tweet.text, :published_at =>tweet.created_at)
    end
  end

  def tweets_stale?
    most_recent_tweet = self.tweets.order("published_at desc").first.published_at
    (Time.now - most_recent_tweet)/60 >= 15  
  end

end
