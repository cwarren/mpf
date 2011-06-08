require 'spec_helper'

describe "admin/service_packages/edit.html.erb" do

  it "renders successfully" do
      @service_package = ServicePackage.make
      @mobile_services = []
      render
  end

  context "no services are available" do
    before(:each) do
      @service_package = ServicePackage.make
      @mobile_services = []
      render
    end

    it "indicates there are no available services" do
      rendered.should have_selector("div.mobile_service_chooser") do |m|
        m.should contain(/no services are available to put in packages/i)
      end
    end
  end

  context "has no services" do
    before(:each) do
      @service_package = ServicePackage.make
      @mobile_services = MobileService.make(3)
      render
    end
    
    it "displays a section for editing package info" do
      rendered.should have_selector("div.package_info")
    end

    it "displays a section for listing all the available services" do
      rendered.should have_selector("div.mobile_service_chooser")
    end
    
    it "lists all available services"
    
    it "indicates that no services are currently in this package"
  
  end
  
  context "has 2 services" do
    before(:each) do
      @service_package = ServicePackage.make
      @mobile_services = MobileService.make(3)
      @service_package.mobile_services = @mobile_services[0..1]
      render
    end
       
    it "lists all available services"
    
    it "indicates that services 1 and 2 are currently in this package"
    
  end

end
