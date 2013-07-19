get '/' do
  erb :index
end

get '/create' do
  erb :new_post
end

post '/create' do
  @new_post =  Post.new(params[:post])

  if @new_post.save
    redirect '/'
  else
    erb :error_page
  end
end

get '/post/:id' do
  @requested_post = Post.find(params[:id])

  erb :post
end

get '/tag/:name' do
  @requested_tag = Tag.where(name: params[:name]).first

  erb :tagged_posts
end 
