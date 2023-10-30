# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present? || ENV['RENDER'].present?
  config.assets.compile = false
  config.active_storage.service = :local
  config.log_level = :info
  config.log_tags = [:request_id]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.report_deprecations = false
  config.log_formatter = Logger::Formatter.new

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new($stdout)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
  config.action_mailer.default_url_options = { host: ENV.fetch('MAILER_HOST') }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    user_name: ENV.fetch('GMAIL_USERNAME'),
    password: ENV.fetch('GMAIL_PASSWORD'),
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'example.com',
    authentication: 'plain',
    enable_starttls_auto: true
  }
  config.active_record.dump_schema_after_migration = false
end
