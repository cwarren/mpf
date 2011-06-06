require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe Admin::MobileServicesController do

  render_views

  def mock_mobile_service(stubs={})
    mock_icon = mock("testicon");
    mock_icon.stub!(:url,"http://foo");
    mock_icon.stub!(:exists?,true);
    stubs['icon'] = mock_icon
    @mock_mobile_service ||= mock_model(MobileService, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all mobile_services as @mobile_services" do
      MobileService.stub(:all) { [mock_mobile_service] }
      get :index
      assigns(:mobile_services).should eq([mock_mobile_service])
    end
  end

  describe "GET show" do
    it "assigns the requested mobile_service as @mobile_service" do
      MobileService.stub(:find).with("37") { mock_mobile_service }
      get :show, :id => "37"
      assigns(:mobile_service).should be(mock_mobile_service)
    end
  end

  describe "GET new" do
    it "assigns a new mobile_service as @mobile_service" do
      MobileService.stub(:new) { mock_mobile_service }
      get :new
      assigns(:mobile_service).should be(mock_mobile_service)
    end
  end

  describe "GET edit" do
    it "assigns the requested mobile_service as @mobile_service" do
      MobileService.stub(:find).with("37") { mock_mobile_service }
      get :edit, :id => "37"
      assigns(:mobile_service).should be(mock_mobile_service)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created mobile_service as @mobile_service" do
        MobileService.stub(:new).with({'these' => 'params'}) { mock_mobile_service(:save => true) }
        post :create, :mobile_service => {'these' => 'params'}
        assigns(:mobile_service).should be(mock_mobile_service)
      end

      it "redirects to the created mobile_service" do
        MobileService.stub(:new) { mock_mobile_service(:save => true) }
        post :create, :mobile_service => {}
        response.should redirect_to(admin_mobile_service_url(mock_mobile_service))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved mobile_service as @mobile_service" do
        MobileService.stub(:new).with({'these' => 'params'}) { mock_mobile_service(:save => false) }
        post :create, :mobile_service => {'these' => 'params'}
        assigns(:mobile_service).should be(mock_mobile_service)
      end

      it "re-renders the 'new' template" do
        MobileService.stub(:new) { mock_mobile_service(:save => false) }
        post :create, :mobile_service => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested mobile_service" do
        MobileService.stub(:find).with("37") { mock_mobile_service }
        mock_mobile_service.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :mobile_service => {'these' => 'params'}
      end

      it "assigns the requested mobile_service as @mobile_service" do
        MobileService.stub(:find) { mock_mobile_service(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:mobile_service).should be(mock_mobile_service)
      end

      it "redirects to the mobile_service" do
        MobileService.stub(:find) { mock_mobile_service(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(admin_mobile_service_url(mock_mobile_service))
      end
    end

    describe "with invalid params" do
      it "assigns the mobile_service as @mobile_service" do
        MobileService.stub(:find) { mock_mobile_service(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:mobile_service).should be(mock_mobile_service)
      end

      it "re-renders the 'edit' template" do
        MobileService.stub(:find) { mock_mobile_service(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested mobile_service" do
      MobileService.stub(:find).with("37") { mock_mobile_service }
      mock_mobile_service.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the mobile_services list" do
      MobileService.stub(:find) { mock_mobile_service }
      delete :destroy, :id => "1"
      response.should redirect_to(admin_mobile_services_url)
    end
  end

end
