def login(user)
  if returned_user = User.where('email = ?', params[:email]).first
    if returned_user.password == params[:password]
      session[:user_id] = user.id  
    end
  end
  redirect '/homepage'
end

def current_user
  session[:user_id]
end



