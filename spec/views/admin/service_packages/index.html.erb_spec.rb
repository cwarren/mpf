require 'spec_helper'

describe "admin/service_packages/index.html.erb" do
  before(:each) do
    assign(:service_packages, [
      stub_model(ServicePackage,
      :title => "Sample SP 1",
      :urlname => "samplesp1",
      :description => "Sample sp 1 description",
      :icon => "sample_sp1.png",
      :is_live => true
    ),
      stub_model(ServicePackage,
            :title => "Sample SP 2",
            :urlname => "samplesp2",
            :description => "Sample sp 2 description",
            :icon => "sample_sp2.png",
            :is_live => true
    )
    ])
  end

  it "renders successfully" do
    render
  end
  
end
