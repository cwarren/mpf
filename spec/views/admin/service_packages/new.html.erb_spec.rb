require 'spec_helper'

describe "admin/service_packages/new.html.erb" do
  before(:each) do
    assign(:service_package, stub_model(ServicePackage,
      :title => "Sample SP",
      :urlname => "samplesp",
      :description => "Sample sp description",
      :icon => "sample_sp.png",
      :is_live => true
    ).as_new_record)
  end

  it "renders successfully" do
    render
  end

end
