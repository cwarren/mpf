class Admin::AdminController < ApplicationController

  before_filter :require_login
  
  def require_login
    @current_user ||= User.find_by_id(session[:user_id])
    redirect_to admin_login_path unless @current_user
  end
  
end