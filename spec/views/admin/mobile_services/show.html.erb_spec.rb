require 'spec_helper'

describe "admin/mobile_services/show.html.erb" do

  it "renders successfully" do
    @mobile_service = MobileService.make
    render
  end

  context "is not in any service packages" do
    before(:each) do
      @mobile_service = MobileService.make
    end
    
    it "indicates there are no packages" do
      render
      rendered.should have_selector("div.service_package_list li", :count => 1) do |m|
        m.should contain(/none/i)
      end
    end
  end

  context "in two service packages" do
    before(:each) do
      @mobile_service = MobileService.make(:with_2_packages)
    end

    it "lists exactly the packages of which it is a member" do
      render
      rendered.should have_selector("div.service_package_list li a", :count => 2) do |m|
        m.should contain(/#{Regexp.quote(@mobile_service.service_packages[0].title)}/)
        m.should contain(/#{Regexp.quote(@mobile_service.service_packages[1].title)}/)
      end
    end
  end

end
