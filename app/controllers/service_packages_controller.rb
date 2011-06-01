class ServicePackagesController < ApplicationController

  # GET /service_packages
  # GET /service_packages.xml
  def index
    @service_packages = ServicePackage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_packages }
    end
  end

  # GET /service_packages/1
  # GET /service_packages/1.xml
  def show
    @service_package = ServicePackage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_package }
    end
  end

end
