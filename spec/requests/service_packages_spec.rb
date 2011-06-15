require 'spec_helper'

describe "ServicePackages" do
  describe "GET /service_packages" do
    it "works" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get service_packages_path
      response.status.should be(200)
    end
  end
end
