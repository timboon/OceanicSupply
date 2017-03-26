require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)



module Railsapp
  class Application < Rails::Application
    config.action_controller.include_all_helpers = false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    
    config.paperclip_defaults = {
      storage: :s3,
      s3_host_name: 's3-ap-southeast-2.amazonaws.com',
      s3_credentials: {
        bucket: 'elasticbeanstalk-ap-southeast-2-608743638809',
        access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
        secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
        s3_region: ENV.fetch('AWS_REGION'),
      }
    }
    
  end
end
