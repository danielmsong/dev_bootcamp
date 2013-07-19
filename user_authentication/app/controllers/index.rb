get '/' do
  erb :index
end

get '/create_user' do
  erb :create_user
end

post '/create_user' do
  racer = User.new(:first_name => params[:first_name],
                   :last_name => params[:last_name],
                   :email => params[:email],
                   :password => params[:password])
  racer.save
  redirect to '/'
end

post '/login' do
  @email = params[:email]
  @password = params[:password]

  if User.where(:email => @email, :password => @password).count == 1
    @user = User.where(:email => @email)
    id = @user.first.id
    session[:user_id] = id
    redirect to '/homepage'
  else
    redirect to '/'
  end
end

get '/homepage' do
  if session[:user_id].nil?
    redirect to '/'
  else
    erb :home_page
  end
end

get '/logout' do
  session.clear
  redirect to '/'
end
