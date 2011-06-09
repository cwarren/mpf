module Admin::ServicePackagesHelper

  def add_ms_button
   "<div class=\"add_service_button\">&lt;+</div>".html_safe
  end
  
  def remove_ms_button
   "<div class=\"remove_service_button\">X&gt;</div>".html_safe
  end

end
