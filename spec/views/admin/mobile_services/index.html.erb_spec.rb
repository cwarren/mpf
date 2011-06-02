require 'spec_helper'

describe "admin/mobile_services/index.html.erb" do
  before(:each) do
    assign(:mobile_services, [
      stub_model(MobileService,
      :title => "Sample MS 1",
      :description => "Sample MS 1 description",
      :icon => "sample_ms_1.png",
      :url => "http://m.williams.edu/emergency1/",
      :is_live => true,
      :is_restricted => false      
    ),
      stub_model(MobileService,
            :title => "Sample MS 2",
            :description => "Sample MS 2 description",
            :icon => "sample_ms_2.png",
            :url => "http://m.williams.edu/emergency2/",
            :is_live => true,
            :is_restricted => false      
    )
    ])
  end

  it "renders successfully" do
    render
  end
  
end
