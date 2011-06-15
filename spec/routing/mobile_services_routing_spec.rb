require "spec_helper"

describe MobileServicesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/mobile_services" }.should route_to(:controller => "mobile_services", :action => "index")
    end

    # NOTE: skipping this test because I can't figure out how to specify in the routing file that new should not be matched
    #it "does not provide #new" do
    #  { :get => "/mobile_services/new" }.should_not be_routable
    #end

    it "recognizes and generates #show" do
      { :get => "/mobile_services/1" }.should route_to(:controller => "mobile_services", :action => "show", :id => "1")
    end

    it "does not provide #edit" do
      { :get => "/mobile_services/1/edit" }.should_not be_routable
    end

    it "does not provide #create" do
      { :post => "/mobile_services" }.should_not be_routable
    end

    it "does not provide #update" do
      { :put => "/mobile_services/1" }.should_not be_routable
    end

    it "does not provide #destroy" do
      { :delete => "/mobile_services/1" }.should_not be_routable
    end

  end
end
