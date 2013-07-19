get '/' do
  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/login' do
  @user = User.find_by_email(params[:email])
  login(@user)
end

get '/logout' do
  session.clear
  redirect to '/'
end

