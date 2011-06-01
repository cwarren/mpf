require "spec_helper"

describe Admin::ServicePackagesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/admin/service_packages" }.should route_to(:controller => "admin/service_packages", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admin/service_packages/new" }.should route_to(:controller => "admin/service_packages", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin/service_packages/1" }.should route_to(:controller => "admin/service_packages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin/service_packages/1/edit" }.should route_to(:controller => "admin/service_packages", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin/service_packages" }.should route_to(:controller => "admin/service_packages", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/admin/service_packages/1" }.should route_to(:controller => "admin/service_packages", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin/service_packages/1" }.should route_to(:controller => "admin/service_packages", :action => "destroy", :id => "1")
    end

  end
end
