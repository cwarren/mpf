set :rails_env, "production" 
role :web, "mobile-webdev.williams.edu"
role :app, "mobile-webdev.williams.edu"
role :db,  "mobile-webdev.williams.edu", :primary => true