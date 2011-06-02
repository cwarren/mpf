require 'spec_helper'

describe "admin/service_packages/edit.html.erb" do
  before(:each) do
    @service_package = assign(:service_package, stub_model(ServicePackage,
      :title => "Sample SP",
      :urlname => "samplesp",
      :description => "Sample sp description",
      :icon => "sample_sp.png",
      :is_live => true
    ))
  end

  it "renders successfully" do
    render
  end

end
