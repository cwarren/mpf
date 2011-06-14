class Admin::ServicePackagesController < Admin::AdminController
  
  layout "admin/application"
  
  @@page_title_base = "Admin Service Package"
  
  # GET /service_packages
  # GET /service_packages.xml
  def index
    @service_packages = ServicePackage.all
    @page_title = @@page_title_base+"s"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_packages }
    end
  end

  # GET /service_packages/1
  # GET /service_packages/1.xml
  def show
    @service_package = ServicePackage.find(params[:id])
    @page_title = @@page_title_base+" : "+@service_package.title
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_package }
    end
  end

  # GET /service_packages/new
  # GET /service_packages/new.xml
  def new
    @service_package = ServicePackage.new
    @page_title = @@page_title_base+" : New"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_package }
    end
  end

  # GET /service_packages/1/edit
  def edit
    @service_package = ServicePackage.find(params[:id])
    @page_title = @@page_title_base+" : Edit "+@service_package.title
    @mobile_services = MobileService.all
  end

  # POST /service_packages
  # POST /service_packages.xml
  def create
    @service_package = ServicePackage.new(params[:service_package])
    @service_package.is_live = false
    
    respond_to do |format|
      if @service_package.save
        format.html { redirect_to(admin_service_package_url(@service_package), :notice => 'Service package was successfully created.') }
        format.xml  { render :xml => @service_package, :status => :created, :location => @service_package }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_package.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_packages/1
  # PUT /service_packages/1.xml
  def update
    @service_package = ServicePackage.find(params[:id])
    @mobile_services = MobileService.all
    
    respond_to do |format|
      if @service_package.update_attributes(params[:service_package])
        format.html { redirect_to(admin_service_package_url(@service_package), :notice => 'Service package was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_package.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_packages/1
  # DELETE /service_packages/1.xml
  def destroy
    @service_package = ServicePackage.find(params[:id])
    @service_package.destroy

    respond_to do |format|
      format.html { redirect_to(admin_service_packages_url) }
      format.xml  { head :ok }
    end
  end
  
  #-------------------------------------------------------------
  
  # POST /service_packages/1/add_service/2
  def add_service
    sp = ServicePackage.find(params[:id])
    
    # do nothing if the service is already in this package
    if (sp.mobile_service_ids.include?(params[:service_id].to_i))
      respond_to do |format|
        format.js { render :nothing => true }
      end
      return
    end

    sp.mobile_services << MobileService.find(params[:service_id])

    sp.save

    respond_to do |format|
      format.js { render :nothing => true }
    end

  end
  
  
  # POST /service_packages/1/remove_service/2
  def remove_service
    sp = ServicePackage.find(params[:id])
    
    # do nothing if the service is already in this package
    if (! (sp.mobile_service_ids.include?(params[:service_id].to_i)))
      respond_to do |format|
        format.js { render :nothing => true }
      end
      return
    end

    sp.mobile_services.delete(MobileService.find(params[:service_id]))

    sp.save
    
    respond_to do |format|
      format.js { render :nothing => true }
    end

  end
  

end
