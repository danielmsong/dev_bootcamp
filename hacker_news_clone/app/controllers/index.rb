
get '/' do
  @posts = Post.all
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  if User.authenticate?(params[:password], params[:username])
    @user = User.find_by_username(params[:username])
    session[:user_id] = @user.id
    redirect "/user/#{session[:user_id]}"
  else  
    @error1 = "Invalid login request. Please try again"
    erb :login
  end
end

post '/upvote/post/:id' do

  if session[:"pvote#{params[:id]}_#{current_user.id}"] != false
    @post = Post.find(params[:id])
    vote = @post.pvotes.first
    vote.votecount +=1 
    vote.save
    session[:"pvote#{params[:id]}_#{current_user.id}"] = false
  end 
  
  redirect "/post/#{params[:id]}"

end

post '/upvote/comment/:id' do

  if session[:"cvote#{params[:id]}_#{current_user.id}"] != false
    @comment = Comment.find(params[:id])
    vote = @comment.cvotes.first
    vote.votecount +=1 
    vote.save
    session[:"cvote#{params[:id]}_#{current_user.id}"] = false
  end 
  
  redirect "/post/#{Comment.find(params[:id]).post.id}"

end  

post '/signup' do

password = params[:password1]
retyped_password = params[:password2]

  if password == retyped_password

    @user = User.new(
      username:  params[:username],
      firstname: params[:firstname],
      lastname:  params[:lastname],
      email:     params[:email],
      password:  params[:password1]
      )

    if @user.save  
      session[:user_id] = @user.id
      redirect "/user/#{session[:user_id]}"
    else
      erb :login
    end  
  else
    @error2 = "Password is not matching"
    erb :login
  end
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end

get '/user/:id' do
  if session[:user_id] == params[:id].to_i
    erb :profile
  else
    redirect "/"
  end    
end

get '/signout' do
  session[:user_id] = nil
  redirect '/'
end



