class Admin::PackageMembershipsController < Admin::AdminController

  def create    
    package_membership = PackageMembership.new do |pm|
      pm.service_package_id = params[:package]
      pm.package_item_id = params[:item]
      pm.package_item_type = params[:item_type] 
    end
    
    pmax = (PackageMembership.find_by_service_package_id(params[:package], {:order => 'ordering DESC'}))
    max_existing_ordering = pmax.nil? ? 0 : pmax.ordering
    package_membership.ordering = max_existing_ordering + 1
    
    if (package_membership.save)
      respond_to do |format|
        format.js { render :json => package_membership.id.to_json }
      end
    else
      return false
    end
  end
  

  # NOTE: this ONLY updates the ordering!
  def update
    package_membership = PackageMembership.find(params[:id])
    package_membership.ordering = params[:new_idx]
    if (package_membership.save)
      respond_to do |format|
        format.js { render :json => package_membership.id.to_json }
      end
    else
      return false
    end
  end


  def destroy
    pm = PackageMembership.find(params[:id])
    pm.destroy
    
    respond_to do |format|
      format.js { render :nothing => true }
    end

  end

end
