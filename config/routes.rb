Mpf::Application.routes.draw do

  secure_protocol = "https://"
  if (Rails.env.development? or Rails.env.test?)
    secure_protocol = "http://"
  end  

  resources :mobile_services, :only => [:index, :show]
  resources :service_packages, :only => [:index, :show]

  get "pages/home"
  get "pages/about"
  get "pages/help"
  
  root :to => 'service_packages#index'
  
  # this is supposed to allow auth_ldap_url to be generated with https when needed... but it doesn't seem to be working
  #match "/auth/ldap"=> redirect("/auth/ldap"), :as => "auth_ldap", :constraints => { :protocol => secure_protocol }
  
  match "/auth/ldap/callback" => "admin/user_sessions#create", :constraints => { :protocol => secure_protocol }
  match "/auth/failure" => redirect("/admin/login"), :notice => "login failed"

  namespace "admin" do
    get "pages/home"
    get "pages/about"
    get "pages/help"

    resources :mobile_services
    match "mobile_services/:id/add_to_package/:package_id" => "mobile_services#add_package",       :as => :add_package_to_service,      :via => :post, :id => /\d+/, :package_id => /\d+/
    match "mobile_services/:id/remove_from_package/:package_id" => "mobile_services#remove_package", :as => :remove_package_from_service, :via => :post, :id => /\d+/, :package_id => /\d+/

    resources :service_packages 
    match "service_packages/:id/add_service/:service_id" => "service_packages#add_service",       :as => :add_service_to_package,      :via => :post, :id => /\d+/, :service_id => /\d+/
    match "service_packages/:id/remove_service/:service_id" => "service_packages#remove_service", :as => :remove_service_from_package, :via => :post, :id => /\d+/, :service_id => /\d+/

    resources :users

    #resources :user_sessions, :only => [:new, :create, :destroy], :constraints => { :protocol => secure_protocol }
    
    match "login" => "user_sessions#new", :as => :login, :constraints => { :protocol => secure_protocol }
    match "logout" => "user_sessions#destroy", :as => :logout

    root :to => 'pages#home'
  end

end
