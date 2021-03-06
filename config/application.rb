require_relative 'boot'

require 'rails/all'
require 'dotenv' ; Dotenv.load ".env", ".env.#{Rails.env}"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KnowYourSpending
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_job.queue_name_prefix = Rails.env
    config.active_job.queue_adapter = :sidekiq

    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      html_tag.html_safe
    }

  end
end
