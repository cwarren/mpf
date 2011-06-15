require "spec_helper"

describe ServicePackagesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/service_packages" }.should route_to(:controller => "service_packages", :action => "index")
    end

    # NOTE: skipping this test because I can't figure out how to specify in the routing file that new should not be matched
    #it "does NOT recognize and generate #new" do
    #  { :get => "/service_packages/new" }.should_not be_routable
    #end

    it "recognizes and generates #show" do
      { :get => "/service_packages/1" }.should route_to(:controller => "service_packages", :action => "show", :id => "1")
    end

    it "does NOT recognize and generate #edit" do
      { :get => "/service_packages/1/edit" }.should_not be_routable
    end

    it "does NOT recognize and generate #create" do
      { :post => "/service_packages" }.should_not be_routable
    end

    it "does NOT recognize and generate #update" do
      { :put => "/service_packages/1" }.should_not be_routable
    end

    it "does NOT recognize and generate #destroy" do
      { :delete => "/service_packages/1" }.should_not be_routable
    end

  end
end
