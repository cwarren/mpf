module Admin::ApplicationHelper

  def get_service_types_options_array
    res = []
    @service_types.each { |st| res.push([st,st]) }
    return res
  end


  def admin_mobile_service_item(ms,pm,sp,before="",after="")
    ("<li id=\"ms_#{ms.id.to_s}\" for_item=\"#{ms.id.to_s}\" for_package=\"#{sp.id.to_s}\" as=\"#{pm.nil? ? 0 : pm.id.to_s}\" class=\"item_not_hovering\">"+
     before+"<div class=\"content_block #{ms.is_live ? 'live' : 'not_live'} #{ms.is_restricted ? 'restricted' : 'not_restricted'}\">"+
     (
     link_to(
             (
              "<div class=\"icon_block\"> "+(image_tag ms.icon.url(:base))+"</div>"+ms.title
             ).html_safe,
             admin_mobile_service_path(ms),
             :title=>"#{ms.is_live ? 'live' : 'not live'}, #{ms.is_restricted ? 'restricted' : 'not restricted'}"
            )
     )+
     "</div>"+after+"</li>").html_safe
  end

  def admin_service_package_item(sp,pm,before="",after="")
    ("<li id=\"sp_#{sp.id.to_s}\" for=\"#{sp.id.to_s}\" as=\"#{pm.nil? ? 0 : pm.id.to_s}\">"+
     before+"<div class=\"content_block #{sp.is_live ? 'live' : 'not_live'}\"> "+
     (link_to(((image_tag sp.icon.url(:base)) + sp.title),admin_service_package_path(sp)))+
     "</div>"+after+"</li>").html_safe
  end

  def admin_item (item, package, membership, before="", after="")
    id_prefix = "ms_"

    content_classes = "content_block"
    content_classes += item.is_live ? ' live' : ' not_live'
    content_classes += item.is_restricted ? ' restricted' : ' not_restricted'

    item_link_ref_path = ""
    item_link_title_info = item.is_live ? "live" : "not live"

    if (item.class.to_s == "ServicePackage")
      id_prefix = "sp_"
      content_classes += " type_package"
      item_link_ref_path = admin_service_package_path(item)
    elsif (item.class.to_s == "MobileService")
      content_classes += " type_service"
      item_link_ref_path = admin_mobile_service_path(item)
      item_link_title_info += ", #{item.is_restricted ? 'restricted' : 'not restricted'}"
    end


    ("<li id=\"#{id_prefix}#{item.id.to_s}\" for_item=\"#{item.id.to_s}\" for_package=\"#{package.id.to_s}\" as=\"#{membership.nil? ? 0 : membership.id.to_s}\" item_type=\"#{item.class}\" class=\"item_not_hovering\">"+
     before+"<div class=\"#{content_classes}\">"+
     (
     link_to(
             (
              "<div class=\"icon_block\"> "+(image_tag item.icon.url(:base))+"</div>"+item.title
             ).html_safe,
             item_link_ref_path,
             :title=>item_link_title_info
            )
     )+
     "</div>"+after+"</li>").html_safe   
  end

  def add_button(txt="&lt;+")
   "<div class=\"add_button action_button button\">".html_safe+txt.html_safe+"</div>".html_safe
  end
  
  def remove_button(txt="X&gt;")
   "<div class=\"remove_button action_button button\">".html_safe+txt.html_safe+"</div>".html_safe
  end

  def ordering_handle
    "<div class=\"ordering_handle\">".html_safe+(image_tag "admin/ordering_handle.png").html_safe+"</div>".html_safe
  end
  
end
