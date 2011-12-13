Rails.application.config.middleware.use OmniAuth::Builder do 
   provider :ldap, :host => 'nds1.williams.edu', :port => 636, :method => :ssl, 
            :base => 'o=williams', :uid => 'cn'
end