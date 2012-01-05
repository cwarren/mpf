class ServicePackagesController < ApplicationController

  def index
    #@service_packages = ServicePackage.where(:is_live=>true,:is_restricted=>false)
    #@page_title = "All Apps"
    redirect_to :controller=>"service_packages", :action=>"show", :id=>'home'
  end

  def show
    if (params[:id].to_s.match /\A\d+\Z/)
      @service_package = ServicePackage.find(params[:id])
    else
      @service_package = ServicePackage.find_by_urltitle(params[:id])
    end
    @page_title = @service_package.title

    if (@service_package.is_live)
      process_feed_package_items(@service_package.package_items)
    else
      redirect_to :controller=>"service_packages", :action=>"show", :id=>'home'
    end
  end

end
