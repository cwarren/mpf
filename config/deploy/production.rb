set :rails_env, "production" 
role :web, "mobile-web1.williams.edu"
role :app, "mobile-web1.williams.edu"
role :db,  "mobile-web1.williams.edu", :primary => true