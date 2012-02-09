set :application, "mpf"
set :deploy_to, "/var/www/apps/#{application}"
#set :repository,  "git@github.com:cwarren/mpf.git"
#default_run_options[:pty] = true  # Must be set for the password prompt from git to work

#set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
#set :scm, "git"
#set :branch, "master"
#set :deploy_via, :remote_cache

#set :use_sudo, false
#set :runner, 'cwarren'
#set :admin_runner, runner
#set :git, "/usr/local/bin/git"
#set :scm_passphrase, "there's an exception to every rule except this one"
#set :user, "cwarren"


default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :repository, "git@github.com:cwarren/mpf.git"  # Your clone URL
set :scm, "git"
set :user, "cwarren"  # The server's user for deploys
#set :scm_passphrase, 
ssh_options[:forward_agent] = true
set :use_sudo, false
set :runner, 'cwarren'
set :admin_runner, runner
set :branch, "master"
set :deploy_via, :remote_cache


# this is handled by the stages settings instead of hard-coded here
#role :web, "mobile-web1.williams.edu"                          # Your HTTP server, Apache/etc
#role :app, "mobile-web1.williams.edu"                          # This may be the same as your `Web` server
#role :db,  "mobile-web1.williams.edu", :primary => true # This is where Rails migrations will run



#############################################################
#Bundler
#############################################################

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end
  
  task :bundle_new_release, :roles => :app do
    'bundler:create_symlink'
    #run "cd #{release_path} && LC_ALL='en_US.UTF-8' bundle install --path vendor/bundle --without test development"
    run "cd #{release_path} && export LC_ALL='en_US.UTF-8' && bundle --deployment --without test development"
    #run "cd #{release_path} && bundle --deployment --without test development"
    #run "cd #{release_path} && bundle --deployment"
  end
  
  task :lock, :roles => :app do
    run "cd #{current_release} && bundle lock;"
  end
  
  task :unlock, :roles => :app do
    run "cd #{current_release} && bundle unlock;"
  end
end

namespace :deploy do
  
  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/data #{release_path}/public/data"
    run "ln -nfs #{shared_path}/feed_cache #{release_path}/public/feed_cache"
#    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
#    run "ln -nfs #{shared_path}/config/initializers/mailer_config.rb #{release_path}/config/initializers/mailer_config.rb"
  end

  task :start do end
  task :stop do end
#  task :restart, :roles => :app, :except => { :no_release => true } do
#    run "touch #{current_path}/tmp/restart.txt"
#  end

end

after "deploy:update_code", "bundler:bundle_new_release"
after "deploy:update_code", "deploy:symlink_shared"
