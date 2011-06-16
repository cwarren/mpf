require 'spec_helper'

describe Admin::PagesController do

  render_views

  before(:each) do    
    # set up for logged in user
    logged_in  
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    it "should have the correct title" do
      get 'home'
      response.should have_selector("title", :content => "Williams College MPF : Admin Home")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    it "should have the correct title" do
      get 'about'
      response.should have_selector("title", :content => "Williams College MPF : Admin About")
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
    it "should have the correct title" do
      get 'help'
      response.should have_selector("title", :content => "Williams College MPF : Admin Help")
    end
  end

end
