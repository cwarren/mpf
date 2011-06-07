require 'spec_helper'

describe "admin/mobile_services/index.html.erb" do
  before(:each) do
    @mobile_services = MobileService.make(2)
  end

  it "renders successfully" do
    render
  end
  
end
