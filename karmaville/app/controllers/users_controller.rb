class UsersController < ApplicationController
  def index
    @users = User.by_karma.page(current_page)
  end
end
