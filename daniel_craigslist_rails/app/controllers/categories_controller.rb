class CategoriesController < ApplicationController

  def index
  end

  def show
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create 
    category = Category.create(params[:category]) 
    if category 
      @categories = Category.all
      render :index
    else
      render :new
    end
  end

  def show
    @posts = Category.find(params[:id]).posts
    @category = Category.find_by_id(params[:id])
  end
end
