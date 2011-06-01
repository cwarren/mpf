require "spec_helper"

describe ServicePackagesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/service_packages" }.should route_to(:controller => "service_packages", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/service_packages/new" }.should_not be_routable
    end

    it "recognizes and generates #show" do
      { :get => "/service_packages/1" }.should route_to(:controller => "service_packages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/service_packages/1/edit" }.should_not be_routable
    end

    it "recognizes and generates #create" do
      { :post => "/service_packages" }.should_not be_routable
    end

    it "recognizes and generates #update" do
      { :put => "/service_packages/1" }.should_not be_routable
    end

    it "recognizes and generates #destroy" do
      { :delete => "/service_packages/1" }.should_not be_routable
    end

  end
end
