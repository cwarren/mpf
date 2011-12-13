class MobileServicesController < ApplicationController

  def index
    @mobile_services = MobileService.where(:is_live=>true,:is_restricted=>false)
    @page_title = "Services"
  end


  def show
    if (params[:id].match /\A\d+\Z/)
      @mobile_service = MobileService.find(params[:id])
    else
      @mobile_service = MobileService.find_by_urltitle(params[:id])
    end

    if ((@mobile_service.is_live) && (! @mobile_service.is_restricted))

      if (@mobile_service.service_type =~ /native|remote/)
        redirect_to @mobile_service.url
        return
      end
    else
      redirect_to :controller=>"mobile_services",:action=>"index"
    end
  end


end
