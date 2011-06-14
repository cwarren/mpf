require "spec_helper"

describe Admin::MobileServicesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/admin/mobile_services" }.should route_to(:controller => "admin/mobile_services", :action => "index")
    end

    it "recognizes and generates  #new" do
      { :get => "/admin/mobile_services/new" }.should route_to(:controller => "admin/mobile_services", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin/mobile_services/1" }.should route_to(:controller => "admin/mobile_services", :action => "show", :id => "1")
    end

    it "recognizes and generates  #edit" do
      { :get => "/admin/mobile_services/1/edit" }.should route_to(:controller => "admin/mobile_services", :action => "edit", :id => "1")
    end

    it "recognizes and generates  #create" do
      { :post => "/admin/mobile_services" }.should route_to(:controller => "admin/mobile_services", :action => "create")
    end

    it "recognizes and generates  #update" do
      { :put => "/admin/mobile_services/1" }.should route_to(:controller => "admin/mobile_services", :action => "update", :id => "1")
    end

    it "recognizes and generates  #destroy" do
      { :delete => "/admin/mobile_services/1" }.should route_to(:controller => "admin/mobile_services", :action => "destroy", :id => "1")
    end

    it "recognizes and generates #add_package" do
      { :post => "/admin/mobile_services/1/add_to_package/2" }.should route_to(:controller => "admin/mobile_services", :action => "add_package", :id => "1", :package_id => "2")
    end

    it "recognizes and generates #remove_package" do
      { :post => "/admin/mobile_services/1/remove_from_package/2" }.should route_to(:controller => "admin/mobile_services", :action => "remove_package", :id => "1", :package_id => "2")
    end

  end
end
