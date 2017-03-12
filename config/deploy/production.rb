role :app         ,  %w(webth) # 在该服务器上执行app相关的代码
role :web         ,  %w(webth) # 在该服务器上执行web相关的代码，我们的app代码和web代码没有作区分
role :db          ,  %w(webth) # 在该服务器上执行migration相关的代码，在部署多台服务器的情况下，通常指定一台服务器，因为不能多次执行同一个migration
role :production_cron,  %w{webth} # 在该服务器上执行定时任务，将此定时任务的范围限定为sandbox_cron，使用whenever这个gem配置定时任务是会用到

set :stage        ,   :production # 配置stage的名称为production
set :rails_env    ,   :production # 配置rails_env的值为production
set :branch       ,   :master # 配置代码仓库的分支名称
set :deploy_to    ,   "/var/www/#{fetch(:application)}/#{fetch(:stage)}" # 配置项目在服务器上的部署位置
set :puma_threads ,   [4, 16] # 配置puma的线程数量，这个值应该会影响并发的能力
set :puma_workers ,   1 # 配置puma worker的数量，相当于运行几个项目的实例，跟CPU数量和性能有关