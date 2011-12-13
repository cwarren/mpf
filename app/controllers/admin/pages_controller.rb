class Admin::PagesController < ApplicationController

  layout "admin/application"

  @@page_title_base = "Admin"

  def home
    @page_title = @@page_title_base+" Home"
  end

  def help
    @page_title = @@page_title_base+" Help"
  end

end
