require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TtpsRuby2017
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.assets.enabled = true

    config.autoload_paths << "#{Rails.root}/lib"

    config.i18n.available_locales = [:en, :es]
    config.i18n.default_locale = :es
  end
end
