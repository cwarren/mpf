class Admin::UserSessionsController < Admin::AdminController

  skip_before_filter :require_login, :except => :destroy

  def new
    @page_title = "MPF Login"
  end

  def create 
    user_info = request.env["omniauth.auth"][:user_info]
    username = user_info["name"].delete("^a-zA-Z0-9")
    extra_info = request.env["omniauth.auth"][:extra]

    if (@user = User.find_by_username(username))
      @user.first_name = clean_ldap_info(user_info.first_name)
      @user.last_name = clean_ldap_info(user_info.last_name)
      
      session[:user_id] = @user.id
      session[:username] = username
      @user.save

      redirect_to admin_root_path
    else
      redirect_to root_path
    end
    return
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_login_path
  end
  
  private
  
  def clean_ldap_info(info)
    info.gsub(/\A\[\"|\"\]\Z/,'').gsub(/\A\s+|\s+\Z/,'')
  end
  

end