Mpf::Application.routes.draw do

  secure_protocol = "https"
  if (Rails.env.development? or Rails.env.test?)
    secure_protocol = "http"
  end  

  resources :mobile_services, :only => [:index, :show]
  resources :service_packages, :only => [:index, :show]

  # match "/auth/ldap/callback" => "admin/user_sessions#create", :constraints => { :protocol => secure_protocol }
  # phusion passenger has issues matching a route with a protocol constraint, so using below instead of above
  match "/auth/ldap/callback" => "admin/user_sessions#create"
  match "/auth/failure" => redirect("/admin/login"), :notice => "login failed"
  
  namespace "admin" do
    get "pages/home"
    get "pages/help"

    resources :mobile_services
    resources :service_packages
    resources :package_memberships, :only => [:create, :update, :destroy]
    resources :users

    match "login" => "user_sessions#new", :as => :login
    match "logout" => "user_sessions#destroy", :as => :logout

    root :to => 'pages#home'
    match "/:unknown" => redirect('/admin/pages/home')
  end

  # NOTE: this has to go after all the namespace definitions or else the name space roots will match this route
  match "/:urltitle" => "adaptive#reroute", :as => :urltitle, :via=>:get

  root :to => 'service_packages#index'

end
