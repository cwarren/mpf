require 'spec_helper'

describe Admin::ApplicationHelper do


  context "generate mobile service list item" do 
  
    before(:each) do
      @ms = MobileService.make!
    end

    it "has the service id and contains the service icon and title" do
      t = admin_mobile_service_item(@ms)
      t.should have_selector("li#ms_"+@ms.id.to_s)
      t.should have_selector("a img[src='#{@ms.icon.url(:base)}']")
      t.should contain(/#{Regexp.quote(@ms.title)}/)
    end
    
    
    it "puts given text before the service icon and title" do
      t = admin_mobile_service_item(@ms,"before text")
      t.should match(/before text.*\<img/)
    end


    it "puts given text after the service icon and title" do
      t = admin_mobile_service_item(@ms,"","after text")
      t.should match(/\<img.*#{Regexp.quote(@ms.title)}.*after text/)
    end

    it "puts given texts before and after the service icon and title" do
      t = admin_mobile_service_item(@ms,"before text","after text")
      t.should match(/before text.*\<img.*#{Regexp.quote(@ms.title)}.*after text/)
    end

  end


  context "generate service package list item" do
  
    before(:each) do
      @sp = ServicePackage.make!
    end

    it "has the package id and contains the package icon and title" do
      t = admin_service_package_item(@sp)
      t.should have_selector("li#sp_"+@sp.id.to_s)
      t.should have_selector("a img[src='#{@sp.icon.url(:base)}']")
      t.should contain(/#{Regexp.quote(@sp.title)}/)
    end
    
    it "puts given text before the package icon and title" do
      t = admin_service_package_item(@sp,"before text")
      t.should match(/before text.*\<img/)
    end

    it "puts given text after the package icon and title" do
      t = admin_service_package_item(@sp,"","after text")
      t.should match(/\<img.*#{Regexp.quote(@sp.title)}.*after text/)
    end

    it "puts given texts before and after the package icon and title" do
      t = admin_service_package_item(@sp,"before text","after text")
      t.should match(/before text.*\<img.*#{Regexp.quote(@sp.title)}.*after text/)
    end

  end
  
  
  context "add and remove buttons" do

    it "gives a basic add button" do
      t = add_button
      t.should == "<div class=\"add_button button\">&lt;+</div>"
    end

    it "gives an add button with custom text" do
      t = add_button("foo")
      t.should == "<div class=\"add_button button\">foo</div>"
    end

    it "gives a basic remove button" do
      t = remove_button
      t.should == "<div class=\"remove_button button\">X&gt;</div>"
    end

    it "gives a remove button with custom text" do
      t = remove_button("bar")
      t.should == "<div class=\"remove_button button\">bar</div>"
    end


  end

end
