require 'spec_helper'

describe "admin/service_packages/show.html.erb" do

  it "renders successfully" do
    @service_package = ServicePackage.make
    render
  end

  context "has no services" do
    before(:each) do
      @service_package = ServicePackage.make
    end
    
    it "shows 'None' for the list of services" do
      render
      rendered.should have_selector("div.mobile_service_list li", :count => 1) do |m|
        m.should contain(/none/i)
      end
    end
    
  end

  context "has two services" do
    before(:each) do
      @service_package = ServicePackage.make(:with_2_services)
    end

    it "lists exactly the services in the package"  do
      render
      rendered.should have_selector("div.mobile_service_list li a", :count => 2) do |m|
        m.should contain(/(#{Regexp.quote(@service_package.mobile_services[0].title)}|#{Regexp.quote(@service_package.mobile_services[1].title)})/)
      end
    end

  end

end
