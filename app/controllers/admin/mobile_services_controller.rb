class Admin::MobileServicesController < Admin::AdminController
  
  layout "admin/application"
  
  @@page_title_base = "Admin Mobile Service"
  
  # GET /mobile_services
  # GET /mobile_services.xml
  def index
    @page_title = @@page_title_base+"s"
    
    @mobile_services = MobileService.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mobile_services }
    end
  end

  # GET /mobile_services/1
  # GET /mobile_services/1.xml
  def show
    @mobile_service = MobileService.find(params[:id])
    @page_title = @@page_title_base+" : "+@mobile_service.title

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mobile_service }
    end
  end

  # GET /mobile_services/new
  # GET /mobile_services/new.xml
  def new
    @mobile_service = MobileService.new
    @page_title = @@page_title_base+" : New"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mobile_service }
    end
  end

  # GET /mobile_services/1/edit
  def edit
    @mobile_service = MobileService.find(params[:id])
    @page_title = @@page_title_base+" : Edit "+@mobile_service.title
  end

  # POST /mobile_services
  # POST /mobile_services.xml
  def create
    @mobile_service = MobileService.new(params[:mobile_service])

    respond_to do |format|
      if @mobile_service.save
        format.html { redirect_to(admin_mobile_service_url(@mobile_service), :notice => 'Mobile service was successfully created.') }
        format.xml  { render :xml => @mobile_service, :status => :created, :location => @mobile_service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mobile_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mobile_services/1
  # PUT /mobile_services/1.xml
  def update
    @mobile_service = MobileService.find(params[:id])

    respond_to do |format|
      if @mobile_service.update_attributes(params[:mobile_service])
        format.html { redirect_to(admin_mobile_service_url(@mobile_service), :notice => 'Mobile service was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mobile_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mobile_services/1
  # DELETE /mobile_services/1.xml
  def destroy
    @mobile_service = MobileService.find(params[:id])
    @mobile_service.destroy

    respond_to do |format|
      format.html { redirect_to(admin_mobile_services_url) }
      format.xml  { head :ok }
    end
  end
end
