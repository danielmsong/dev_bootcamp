class ApplicationController < ActionController::Base
  protect_from_forgery
  def current_page
    @page = params[:page] || 1
    @page.to_i
  end
  helper_method :current_page
end
