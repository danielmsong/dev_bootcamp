get '/' do
  erb :index
end

post '/user' do
  
  session[:username] = params[:username]
  user = User.find_or_create_by_username(params[:username])

  redirect "/tweet_page"
end

get '/tweet_page' do

  user = User.find_by_username(session[:username])
  if user.tweets.empty? || user.tweets_stale?
    user.fetch_tweets!
  end

  @tweets = user.tweets.limit(10)
  erb :tweet_page
end
