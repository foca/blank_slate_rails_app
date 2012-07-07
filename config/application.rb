require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

if defined?(Bundler)
  Bundler.setup(*Rails.groups(:assets => %w(development test)))
end

if Rails.groups.include?("assets") || Rails.env.development?
  require_relative "asset_pipeline"
end

require "pg"

module BlankSlate
  # Public: Load the .env file which contains environment variables necessary
  # for this application. This will be loaded in development or test, in
  # production heroku makes this variables available to us and we don't need
  # such a file.
  #
  # Returns nil.
  def self.load_env(file=Rails.root.join(".env"))
    File.read(file).each_line do |line|
      line.scan(/(^[^#][A-Z0-9_]+)=(.+)/).each do |key, val|
        ENV[key] = val
      end
    end
    nil
  rescue Errno::ENOENT
    $stderr.puts "[WARNING] No .env file, this will probably fail disastrously :D"
  end

  class Application < Rails::Application
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # Enforce whitelist mode for mass assignment.
    # This will create an empty whitelist of attributes available for mass-assignment for all models
    # in your app. As such, your models will need to explicitly whitelist or blacklist accessible
    # parameters by using an attr_accessible or attr_protected declaration.
    config.active_record.whitelist_attributes = true

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
  end
end

# Load the ENV required for this app to run.
BlankSlate.load_env
