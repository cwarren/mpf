require 'spec_helper'

describe "admin/mobile_services/new.html.erb" do
  before(:each) do
    assign(:mobile_service, stub_model(MobileService,
      :title => "Sample MS",
      :description => "Sample MS description",
      :icon => "sample_ms.png",
      :url => "http://m.williams.edu/emergency/",
      :is_live => true,
      :is_restricted => false      
    ).as_new_record)
  end

  it "renders successfully" do
    render
  end

end
