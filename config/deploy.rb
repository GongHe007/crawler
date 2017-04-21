# config valid only for current version of Capistrano
lock "3.8.0"

set :application, 'crawler'
set :repo_url, "git@github.com:GongHe007/crawler.git"
set :rvm_ruby_version, '2.3.1'
set :log_level, :info
set :linked_files, %w{config/database.yml config/secrets.yml} # files we want symlinking to specific entries in shared.
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp', 'vendor/bundle', 'public/system')
set :assets_dependencies, %w(app/assets lib/assets vendor/assets Gemfile.lock config/routes.rb)

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

# 这些都是capistrano install的时候为你生成的
namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  after :finishing, :compile_assets
  after :finishing, :cleanup
end
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
