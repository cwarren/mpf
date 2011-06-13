require 'spec_helper'

describe "admin/mobile_services/edit.html.erb" do

  it "renders successfully" do
      @mobile_service = MobileService.make!
      render
  end

  context "when the service isn't in any packages" do
    before(:each) do
      @mobile_service = MobileService.make!
      render
    end

    it "indicates there are no packages" do
      rendered.should have_selector("div.package_lister") do |m|
        m.should contain(/not in any packages/i)
      end
    end
  end
  
  context "when the service is in 2 packages" do
    before(:each) do
      @mobile_service = MobileService.make!(:with_2_packages)
      render
    end

    it "indicates which packages it's in" do
      rendered.should have_selector("div.package_lister ul.package_list li") do |m|
        m.should contain(/#{Regexp.quote(@mobile_service.service_packages[0].title)}/)
        m.should contain(/#{Regexp.quote(@mobile_service.service_packages[1].title)}/)
      end
    end
  end


end
