require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module WeddingApi
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    config.active_record.raise_in_transactional_callbacks = true
    config.autoload_paths += %W(
      #{config.root}/app/services
      #{config.root}/lib
    )
  end
end
