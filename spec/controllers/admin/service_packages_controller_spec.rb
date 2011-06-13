require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe Admin::ServicePackagesController do

  #render_views

  def mock_service_package(stubs={})
    mock_icon = mock("testicon");
    mock_icon.stub!(:url,"http://foo");
    mock_icon.stub!(:exists?,true);
    stubs['icon'] = mock_icon
    @mock_service_package ||= mock_model(ServicePackage, stubs).as_null_object
  end

  def mock_mobile_service(stubs={})
    mock_icon = mock("testicon");
    mock_icon.stub!(:url,"http://foo");
    mock_icon.stub!(:exists?,true);
    stubs['icon'] = mock_icon
    @mock_mobile_service ||= mock_model(MobileService, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all service_packages as @service_packages" do
      ServicePackage.stub(:all) { [mock_service_package] }
      get :index
      assigns(:service_packages).should eq([mock_service_package])
    end
  end

  describe "GET show" do
    it "assigns the requested service_package as @service_package" do
      ServicePackage.stub(:find).with("37") { mock_service_package }
      get :show, :id => "37"
      assigns(:service_package).should be(mock_service_package)
    end
  end

  describe "GET new" do
    it "assigns a new service_package as @service_package" do
      ServicePackage.stub(:new) { mock_service_package }
      get :new
      assigns(:service_package).should be(mock_service_package)
    end
  end

  describe "GET edit" do
    it "assigns the requested service_package as @service_package" do
      sp = ServicePackage.make
      ms = MobileService.make
      ServicePackage.stub(:find).with("37") { sp }
      MobileService.stub(:all) { [ms] }
      get :edit, :id => "37"
      assigns(:service_package).should be(sp)
    end

    it "assigns all available mobile services as @mobile_services" do
      sp = ServicePackage.make
      ms = MobileService.make
      ServicePackage.stub(:find).with("37") { sp }
      MobileService.stub(:all) { [ms] }
      get :edit, :id => "37"
      assigns(:mobile_services).should eq([ms])
    end
  end

  describe "POST create" do
  
    valid_param_set = {'title' => 'test title',
                       'urlname' => 'testsp',
                       'description' => 'a test service package',
                       'icon' => File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png'),
                       'is_live' => false}
    
    invalid_param_set = {'title' => 'test title',
                         'urlname' => 'testsp',
                         'description' => 'a test service package',
                         'icon' => File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png'),
                         'is_live' => true}

    describe "with valid params" do
      it "assigns a newly created service_package as @service_package" do
        ServicePackage.stub(:new).with(valid_param_set) { mock_service_package(:save => true) }
        post :create, :service_package => valid_param_set
        assigns(:service_package).should be(mock_service_package)        
      end

      it "redirects to the created service_package" do
        ServicePackage.stub(:new) { mock_service_package(:save => true) }
        post :create, :service_package => valid_param_set
        response.should redirect_to(admin_service_package_url(mock_service_package(valid_param_set)))
      end      
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved service_package as @service_package" do
        ServicePackage.stub(:new).with(invalid_param_set) { mock_service_package(:save => false) }
        post :create, :service_package => invalid_param_set
        assigns(:service_package).should be(mock_service_package)
      end

      it "re-renders the 'new' template" do
        ServicePackage.stub(:new) { mock_service_package(:save => false) }
        post :create, :service_package => invalid_param_set
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested service_package" do
        ServicePackage.stub(:find).with("37") { mock_service_package }
        mock_service_package.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :service_package => {'these' => 'params'}
      end

      it "assigns the requested service_package as @service_package" do
        ServicePackage.stub(:find) { mock_service_package(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:service_package).should be(mock_service_package)
      end

      it "redirects to the service_package" do
        ServicePackage.stub(:find) { mock_service_package(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(admin_service_package_url(mock_service_package))
      end
    end

    describe "with invalid params" do
      it "assigns the service_package as @service_package" do
        ServicePackage.stub(:find) { mock_service_package(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:service_package).should be(mock_service_package)
      end

      it "re-renders the 'edit' template" do
        ServicePackage.stub(:find) { mock_service_package(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested service_package" do
      ServicePackage.stub(:find).with("37") { mock_service_package }
      mock_service_package.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the service_packages list" do
      ServicePackage.stub(:find) { mock_service_package }
      delete :destroy, :id => "1"
      response.should redirect_to(admin_service_packages_url)
    end
  end

  #-------------------------------------------------------------------

  describe "POST add service"  do

    it "puts the given service in the given package" do
      sp = ServicePackage.make!
      ms = MobileService.make!
      
      xhr :post, :add_service, :id => sp.id, :service_id => ms.id

      response.should be_success
      sp.mobile_services.reload
      sp.mobile_services[0].should == ms
    end
    
    context "when the service is already in the package" do
      it "does nothing" do
        sp = ServicePackage.make!(:with_2_services)
        ms1 = sp.mobile_services[0]
        ms2 = sp.mobile_services[1]

        xhr :post, :add_service, :id => sp.id, :service_id => ms1.id

        response.should be_success
        sp.mobile_services.reload
        sp.mobile_services.length.should == 2
        sp.mobile_services[0].should ==(ms1)
        sp.mobile_services[1].should ==(ms2)
      end
    end
    
  end

  describe "POST remove service" do

    it "removes the given service from the given package" do
        sp = ServicePackage.make!(:with_2_services)
        ms1 = sp.mobile_services[0]
        ms2 = sp.mobile_services[1]

        xhr :post, :remove_service, :id => sp.id, :service_id => ms1.id
    
        response.should be_success # NOTE: this passes even when the remove action is undefined....?
        
        #sp = ServicePackage.find_by_id(sp.id)
        sp.mobile_services.reload
        
        sp.mobile_services.length.should == 1
        sp.mobile_services[0].should ==(ms2)
    end

    context "when the service is not in the package"  do
      it "does nothing" do
        sp = ServicePackage.make(:with_2_services)
        sp.save
        ms1 = sp.mobile_services[0]
        ms2 = sp.mobile_services[1]
        ms3 = MobileService.make
        ms3.save
        
        xhr :post, :remove_service, :id => sp.id, :service_id => ms3.id
        
        response.should be_success
        sp.mobile_services.reload
        sp.mobile_services.length.should == 2
        sp.mobile_services[0].should ==(ms1)
        sp.mobile_services[1].should ==(ms2)
      end
    end
  end

end
