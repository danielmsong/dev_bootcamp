get '/' do
  @categories = Category.all

  erb :index
end

get '/:id/create' do
  @category = Category.find_by_id(params[:id])
  erb :create_post
end

post '/:id/create' do
  # @id = params[:id]
  @new_post = Post.create(title: params[:title],
                       description: params[:description],
                       price: params[:price],
                       email: params[:email],
                       category_id: params[:category_id]
                       )
  redirect to '/'
end

get '/:category' do
  @category_id = params[:category]
  @category = Category.where(:id => @category_id).first
  redirect '/' if @category == nil
  @posts = Post.where(:category_id => @category_id)
  erb :category_page
end

get '/:category/:post' do
  @post = Post.where(:id => params[:post]).first

  erb :post_page
end




