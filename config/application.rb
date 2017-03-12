require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Crawler
  class Application < Rails::Application
    config.eager_load_paths += Dir["#{config.root}/lib/**/"]
    config.eager_load_paths += Dir["#{config.root}/app/models/**/"]
    config.eager_load_paths += Dir["#{config.root}/app/**/"]
    config.time_zone = "Beijing"
    config.encoding = "utf-8"
  end
end
