class Admin::MobileServicesController < Admin::AdminController

  @@page_title_base = "Admin : Service"

  def index
    @page_title = @@page_title_base+"s"
    @mobile_services = MobileService.all
  end


  def show
    @mobile_service = MobileService.find(params[:id])
    @page_title = @@page_title_base+" : "+@mobile_service.title
  end


  def new
    @mobile_service = MobileService.new
    @page_title = @@page_title_base+" : New"
  end


  def edit
    @mobile_service = MobileService.find(params[:id])
    @packages_not_in = ServicePackage.all - (@mobile_service.package_memberships.collect {|pm| pm.service_package} )
    @page_title = @@page_title_base+" : Edit "+@mobile_service.title
  end


  def create
    @mobile_service = MobileService.new(params[:mobile_service])
    if @mobile_service.save
      redirect_to(admin_mobile_service_url(@mobile_service), :notice => 'Mobile service was successfully created.')
    else
      render "new"
    end
  end


  def update
    @mobile_service = MobileService.find(params[:id])
    if @mobile_service.update_attributes(params[:mobile_service])
      redirect_to(admin_mobile_service_url(@mobile_service), :notice => 'Mobile service was successfully updated.')
    else
      render "edit"
    end
  end


  def destroy
    @mobile_service = MobileService.find(params[:id])
    @mobile_service.destroy
    redirect_to(admin_mobile_services_url)
  end
  
end
