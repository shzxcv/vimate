require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Vimate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.skip_routes true
      g.assets false
      g.helper false
      g.test_framework false
    end

    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      if instance.kind_of?(ActionView::Helpers::Tags::Label)
        html_tag.html_safe
      else
        class_name = instance.instance_variable_get(:@object_name)
        method_name = instance.instance_variable_get(:@method_name)
        input_error_icon = html_tag.gsub("class=\"", "class=\"is-invalid ").html_safe
        below_error_message = "<div class=\"invalid-feedback\">#{I18n.t("activerecord.attributes.#{class_name}.#{method_name}")}#{instance.error_message.first}</div>".html_safe
        input_error_icon.concat(below_error_message)
      end
    end
  end
end
