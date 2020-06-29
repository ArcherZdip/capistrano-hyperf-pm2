# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

set :application, "example"
set :repo_url, "git@git.example.com:example.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, ENV["branch"] || "master"

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
set :deploy_to, -> { "/home/www/sites/#{fetch(:application)}" }

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :hyperf_server_user, "www"
set :hyperf_migration_roles, "task"
set :hyperf_migration_artisan_flags, "--force"
set :pm2_env_variables, { PATH: "/home/www/.nvm/versions/node/v10.19.0/bin:$PATH" }
set :pm2_main_file, 'main.config.js'
set :pm2_app_command, 'main.config.js'

after 'deploy:updated', 'hyperf:migrate'
after 'deploy:updated', 'hyperf:hyperf_optimize'
before 'deploy:finishing', 'pm2:upload_pm2_main'
after 'deploy:finishing', 'pm2:delete'
after 'deploy:finishing', 'pm2:start'