module ApplicationHelper

  def admin_mobile_service_item(ms,before="",after="")
    ("<li id=\"ms_#{ms.id.to_s}\" for=\"#{ms.id.to_s}\" "+
     "class=\"#{ms.is_live ? 'live' : 'not_live'} #{ms.is_restricted ? 'restricted' : 'not_restricted'}\">"+
     before+
     (link_to(((image_tag ms.icon.url(:base)) + ms.title),admin_mobile_service_path(ms)))+
     after+"</li>").html_safe
  end

  def admin_service_package_item(sp,before="",after="")
    ("<li id=\"ms_#{sp.id.to_s}\" for=\"#{ms.id.to_s}\" "+
     "class=\"#{sp.is_live ? 'live' : 'not_live'}\">"+
     before+
     (link_to(((image_tag sp.icon.url(:base)) + sp.title),admin_service_package_path(sp)))+
     after+"</li>").html_safe
  end

end
