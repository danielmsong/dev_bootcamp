class PostsController < ApplicationController
  
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @category = Category.find_by_id(params[:id])
  end

  def create
    @post = Post.create(params[:post])
    if @post   
      @categories = Category.all
      render 'categories/index'
    else 
      render :new
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

end
