post '/urls' do
  # create a new Url
  @url = Url.new(:url => params[:link],
                 :user_id => current_user ? current_user : "NULL")
  if @url.save 
    if current_user
      redirect '/homepage'
    else 
      redirect '/'
    end     
  else
    erb :index
  end
end

get '/url/:short_url' do
  url = Url.find_by_shortened_url(params[:short_url])
  url.count!
  url.save

  redirect to('http://' + url.url)
  # redirect to appropriate "long" URL
end
