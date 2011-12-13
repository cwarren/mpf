class Admin::AdminController < ApplicationController

  layout "admin/application"

  # login disabled for testing
  #before_filter :require_login
  before_filter :get_server_name
  before_filter :define_service_types
  
  def define_service_types
    @service_types = ["embedded","feed","remote","native iOS","native android"]
  end
 
  def require_login
    @current_user ||= User.find_by_id(session[:user_id])
    
    if ((! @current_user.nil?) && @current_user.role == "none")
      @current_user = nil
    end
    
    # redirect_to admin_login_path unless @current_user
    # NOTE: need to use the below instead of the above to ensure the protocol is https
    if (! @current_user)
      if (Rails.env.development? or Rails.env.test?)
        redirect_to :protocol => 'http://',
          :controller => 'user_sessions',
          :action => 'new'
      else
        redirect_to :protocol => 'https://',
          :controller => 'user_sessions',
          :action => 'new'
      end  
    end
  end
  
  def get_server_name
    @servername = request.env["SERVER_NAME"]
  end

  
end