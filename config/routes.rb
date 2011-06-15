Mpf::Application.routes.draw do

  resources :mobile_services, :only => [:index, :show]
  resources :service_packages, :only => [:index, :show]

  get "pages/home"
  get "pages/about"
  get "pages/help"
  
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
    root :to => 'pages#home'
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
