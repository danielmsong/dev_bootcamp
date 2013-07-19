get '/create_user' do
  erb :create_user
end

post '/create_user' do
  @racer = User.new(:first_name => params[:first_name],
                   :last_name => params[:last_name],
                   :email => params[:email],
                   :password => params[:password])
  racer.save
  login(@racer)
end

get '/homepage' do
  if session[:user_id].nil?
    redirect to '/'
  else
    erb :home_page
  end
end

