require 'spec_helper'

describe "admin/service_packages/show.html.erb" do
  before(:each) do
    @service_package = ServicePackage.make
  end

  it "renders successfully" do
    render
  end

end
