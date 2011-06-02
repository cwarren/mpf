require 'spec_helper'

describe "admin/mobile_services/edit.html.erb" do
  before(:each) do
    @mobile_service = assign(:mobile_service, stub_model(MobileService,
      :title => "Sample MS",
      :description => "Sample MS description",
      :icon => "sample_ms.png",
      :url => "http://m.williams.edu/emergency/",
      :is_live => true,
      :is_restricted => false      
    ))
  end

  it "renders successfully" do
    render
  end

end
