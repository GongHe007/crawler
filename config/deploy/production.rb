set :rails_env, 'production'
set :deploy_to, "/var/www/#{fetch(:application)}"
set :puma_threads, [8, 128]
set :puma_workers, 8
set :keep_releases, 64

role :app, %w{lavps}
role :web, %w{lavps}
role :db, %w{lavps}