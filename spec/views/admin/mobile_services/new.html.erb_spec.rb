require 'spec_helper'

describe "admin/mobile_services/new.html.erb" do
  before(:each) do
    @mobile_service = MobileService.make
  end

  it "renders successfully" do
    render
  end

end
