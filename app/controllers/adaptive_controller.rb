class AdaptiveController < ApplicationController

  def reroute
    if (obj = MobileService.find_by_urltitle(params[:urltitle]))
      if ((obj.is_live) && (! obj.is_restricted))
        @mobile_service = obj

        if (@mobile_service.service_type =~ /remote|native/)
          redirect_to @mobile_service.url
          return
        end

        @page_title = @mobile_service.title
        process_if_feed(@mobile_service)
        render 'mobile_services/show'       
        return
      else
        redirect_to :controller=>"service_packages",:action=>"show", :id=>'home'
      end
    else
      if (params[:urltitle].nil?)
        obj = ServicePackage.find_by_urltitle('home')
      else
        obj = ServicePackage.find_by_urltitle(params[:urltitle])
      end
      if (!obj.nil? && obj.is_live)
        @service_package = obj
        @page_title = @service_package.title        
        process_feed_package_items(@service_package.package_items)
        render 'service_packages/show'
        return
      else
        redirect_to :controller=>"service_packages",:action=>"show", :id=>'home'
      end
    end
  end

end
