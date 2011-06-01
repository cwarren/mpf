class Admin::ServicePackagesController < Admin::AdminController
  
  # GET /service_packages
  # GET /service_packages.xml
  def index
    @service_packages = ServicePackage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_packages }
    end
  end

  # GET /service_packages/1
  # GET /service_packages/1.xml
  def show
    @service_package = ServicePackage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_package }
    end
  end

  # GET /service_packages/new
  # GET /service_packages/new.xml
  def new
    @service_package = ServicePackage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_package }
    end
  end

  # GET /service_packages/1/edit
  def edit
    @service_package = ServicePackage.find(params[:id])
  end

  # POST /service_packages
  # POST /service_packages.xml
  def create
    @service_package = ServicePackage.new(params[:service_package])

    respond_to do |format|
      if @service_package.save
        format.html { redirect_to(@service_package, :notice => 'Service package was successfully created.') }
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

    respond_to do |format|
      if @service_package.update_attributes(params[:service_package])
        format.html { redirect_to(@service_package, :notice => 'Service package was successfully updated.') }
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
      format.html { redirect_to(service_packages_url) }
      format.xml  { head :ok }
    end
  end
end
