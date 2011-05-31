class Admin::PagesController < Admin::AdminController

  layout "admin/application"

  @@page_title_base = "Admin"

  def home
    @page_title = @@page_title_base+" Home"
  end

  def about
    @page_title = @@page_title_base+" About"
  end

  def help
    @page_title = @@page_title_base+" Help"
  end

end
