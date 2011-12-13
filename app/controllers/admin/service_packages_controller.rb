class Admin::ServicePackagesController < Admin::AdminController

  @@page_title_base = "Admin : Package"
  
  def index
    @service_packages = ServicePackage.all
    @page_title = @@page_title_base+"s"
  end


  def show
    @service_package = ServicePackage.find(params[:id])
    @page_title = @@page_title_base+" : "+@service_package.title
  end


  def new
    @service_package = ServicePackage.new
    @page_title = @@page_title_base+" : New"
  end


  def edit
    @service_package = ServicePackage.find(params[:id])
    @page_title = @@page_title_base+" : Edit "+@service_package.title
    @mobile_services = MobileService.all
    @all_service_packages = ServicePackage.all    
  end


  def create
    @service_package = ServicePackage.new(params[:service_package])
    @service_package.is_live = false    
    if @service_package.save
      redirect_to(admin_service_package_url(@service_package), :notice => 'Package was successfully created.')
    else
      render "new"
    end
  end


  def update
    @service_package = ServicePackage.find(params[:id])
    @mobile_services = MobileService.all
    if @service_package.update_attributes(params[:service_package])
      redirect_to(admin_service_package_url(@service_package), :notice => 'Package was successfully updated.')
    else
      render "edit"
    end
  end


  def destroy
    @service_package = ServicePackage.find(params[:id])
    @service_package.destroy
    redirect_to(admin_service_packages_url)
  end
  
end
