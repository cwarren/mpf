require 'spec_helper'

describe "admin/mobile_services/edit.html.erb" do

  it "renders successfully" do
      @mobile_service = MobileService.make!
      @packages_not_in = []
      render
  end

  context "when the service isn't in any (0 of 0) packages" do
    before(:each) do
      @mobile_service = MobileService.make!
      @packages_not_in = []
      render
    end

    it "indicates there are no packages" do
      rendered.should have_selector("div.package_lister") do |m|
        m.should contain(/not in any packages/i)
      end
    end
  end
  
  context "when the service is in 2  of 2 packages" do
    before(:each) do
      @mobile_service = MobileService.make!(:with_2_packages)
      @packages_not_in = []
      render
    end

    it "indicates which packages it's in" do
      rendered.should have_selector("div.package_lister ul.package_list li", :count => 2)
      rendered.should have_selector("div.package_lister ul.package_list li#sp_"+@mobile_service.service_packages[0].id.to_s+" .in_package")
      rendered.should have_selector("div.package_lister ul.package_list li#sp_"+@mobile_service.service_packages[1].id.to_s+" .in_package")
      rendered.should have_selector("div.package_lister ul.package_list li") do |m|
        m.should contain(/#{Regexp.quote(@mobile_service.service_packages[0].title)}/)
        m.should contain(/#{Regexp.quote(@mobile_service.service_packages[1].title)}/)
      end
    end
  end
  
  context "when the service is in 2 of 3 packages" do
    before(:each) do
      @mobile_service = MobileService.make!(:with_2_packages)
      @packages_not_in = [ServicePackage.make]
      @packages_not_in[0].save
      render
    end
    
    it "show the 2 packages it's in and the 1 it's not" do
      rendered.should have_selector("div.package_lister ul.package_list li", :count => 3)
      rendered.should have_selector("div.package_lister ul.package_list li#sp_"+@mobile_service.service_packages[0].id.to_s+" .in_package")
      rendered.should have_selector("div.package_lister ul.package_list li#sp_"+@mobile_service.service_packages[1].id.to_s+" .in_package")
      rendered.should have_selector("div.package_lister ul.package_list li#sp_"+@packages_not_in[0].id.to_s+" .out_of_package")
    end
    
    it "has remove buttons for the packes it's in and an add button for the package it's not in" do
      rendered.should have_selector("div.package_lister ul.package_list li#sp_"+@mobile_service.service_packages[0].id.to_s) do |m|
        m.should have_selector(".remove_button")
        m.should have_selector(".in_package")
      end
      rendered.should have_selector("div.package_lister ul.package_list li#sp_"+@mobile_service.service_packages[1].id.to_s) do |m|
        m.should have_selector(".remove_button")
        m.should have_selector(".in_package")
      end
      rendered.should have_selector("div.package_lister ul.package_list li#sp_"+@packages_not_in[0].id.to_s) do |m|
        m.should have_selector(".add_button")
        m.should have_selector(".out_of_package")
      end
    end

  end

end
