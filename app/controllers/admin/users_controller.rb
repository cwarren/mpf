class Admin::UsersController < Admin::AdminController

  @@page_title_base = "Admin : User"
  
  def index
    @page_title = @@page_title_base+"s"
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
    @page_title = @@page_title_base+" : "+@user.first_name+" "+@user.last_name
  end


  def new
    @user = User.new
    @page_title = @@page_title_base+" : New"
  end


  def edit
    @user = User.find(params[:id])
    @page_title = @@page_title_base+" : Edit "+@user.first_name+" "+@user.last_name
  end


  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(admin_user_url(@user), :notice => 'User was successfully created.')
    else
      render "new"
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(admin_user_url(@user), :notice => 'User was successfully updated.')
    else
      render "edit"
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(admin_users_url)
  end

end
