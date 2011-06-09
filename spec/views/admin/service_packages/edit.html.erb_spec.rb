require 'spec_helper'

describe "admin/service_packages/edit.html.erb" do

  it "renders successfully" do
      @service_package = ServicePackage.make
      @mobile_services = []
      render
  end

  context "when no services are available" do
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

  context "when the package has 0 services of 3 available" do
    before(:each) do
      @service_package = ServicePackage.make
      @mobile_services = MobileService.make(3).sort {|a,b| a.title <=> b.title }
      render
    end
    
    it "displays a section for editing package info" do
      rendered.should have_selector("div.package_info")
    end

    it "displays a section for listing all the available services" do
      rendered.should have_selector("div.mobile_service_chooser")
    end
    
    it "lists all available services" do
      rendered.should have_selector("div.mobile_service_chooser div.available_services ul li", :count => 3) do |m|
        m.should contain(/#{Regexp.quote(@mobile_services[0].title)}/)
        m.should contain(/#{Regexp.quote(@mobile_services[1].title)}/)
        m.should contain(/#{Regexp.quote(@mobile_services[2].title)}/)
      end
    end
    
    it "indicates that no services are currently in this package" do
      rendered.should have_selector("div.mobile_service_chooser div.services_in_package ul li", :count => 0)
      rendered.should have_selector("div.mobile_service_chooser div.services_in_package", :count => 1) do |m|
        m.should contain(/no services in this package/i)
      end
    end
    
    it "has uniquely identifiable service elements" do
      rendered.should have_selector("div.mobile_service_chooser div.available_services ul") do |m|
        m.should have_selector("li#ms_"+@mobile_services[0].id.to_s)
        m.should have_selector("li#ms_"+@mobile_services[1].id.to_s)
        m.should have_selector("li#ms_"+@mobile_services[2].id.to_s)
      end
    end
    
    it "allows services to be added to the package"
  
  end
  
  context "when the package has 2 services of 3 available" do
    before(:each) do
      @service_package = ServicePackage.make
      @mobile_services = MobileService.make(3).sort {|a,b| a.title <=> b.title }
      @service_package.mobile_services = @mobile_services[0..1]
      render
    end
       
    it "lists all available services not yet in the package" do
      rendered.should have_selector("div.mobile_service_chooser div.available_services ul li", :count => 1) do |m|
        m.should_not contain(/#{Regexp.quote(@mobile_services[0].title)}/)
        m.should_not contain(/#{Regexp.quote(@mobile_services[1].title)}/)
        m.should contain(/#{Regexp.quote(@mobile_services[2].title)}/)
      end
    end
    
    it "indicates that services 1 and 2 are currently in this package" do
      rendered.should have_selector("div.mobile_service_chooser div.services_in_package ul li", :count => 2) do |m|
        m.should contain(/#{Regexp.quote(@mobile_services[0].title)}/)
        m.should contain(/#{Regexp.quote(@mobile_services[1].title)}/)
        m.should_not contain(/#{Regexp.quote(@mobile_services[2].title)}/)
      end
    end
    
    it "allows services to be removed from the package"

    context "when one of the services in the package is not live" do
      it "indicates that the service is not live" do
        pending "distinction between not-live and disabled"
      end
    end

  end

end
