module Admin::ApplicationHelper

  def admin_mobile_service_item(ms,before="",after="")
    ("<li id=\"ms_#{ms.id.to_s}\" for=\"#{ms.id.to_s}\">"+
     before+"<div class=\"#{ms.is_live ? 'live' : 'not_live'} #{ms.is_restricted ? 'restricted' : 'not_restricted'}\">"+
     (link_to(((image_tag ms.icon.url(:base)) + ms.title),admin_mobile_service_path(ms)))+
     "</div>"+after+"</li>").html_safe
  end

  def admin_service_package_item(sp,before="",after="")
    ("<li id=\"sp_#{sp.id.to_s}\" for=\"#{sp.id.to_s}\">"+
     before+"<div class=\"#{sp.is_live ? 'live' : 'not_live'}\"> "+
     (link_to(((image_tag sp.icon.url(:base)) + sp.title),admin_service_package_path(sp)))+
     "</div>"+after+"</li>").html_safe
  end

  def add_button(txt="&lt;+")
   "<div class=\"add_button button\">"+txt+"</div>".html_safe
  end
  
  def remove_button(txt="X&gt;")
   "<div class=\"remove_button button\">"+txt+"</div>".html_safe
  end

end
