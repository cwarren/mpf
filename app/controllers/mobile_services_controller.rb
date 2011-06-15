class MobileServicesController < ApplicationController
  
  # GET /mobile_services
  # GET /mobile_services.xml
  def index
    @mobile_services = MobileService.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mobile_services }
    end
  end

  # GET /mobile_services/1
  # GET /mobile_services/1.xml
  def show

    if (params[:id].match /\A\d+\Z/)
      @mobile_service = MobileService.find(params[:id])
    else
      @mobile_service = MobileService.find_by_urltitle(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mobile_service }
    end
  end

end
