Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Default host for URLs in emails.
  config.action_mailer.default_url_options = { :host => "www.upsite.test" }

  # Automatically inject JavaScript needed for LiveReload
  config.middleware.insert_after(ActionDispatch::Static, Rack::LiveReload)

  # Reload local Gems
  RequireReloader.watch_local_gems!

  # Set path so Paperclip can find imagemagick
  Paperclip.options[:command_path] = "/usr/local/bin/"

  # Storage config.
  # config.paperclip_defaults = {
  #   :storage => :s3,
  #   :s3_credentials => {
  #     :bucket => ENV['S3_BUCKET_NAME'],
  #     :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  #     :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  #   }
  # }

  # Postmark config. Uncomment to send Newsletter.
  # config.action_mailer.delivery_method   = :postmark
  # config.action_mailer.postmark_settings = { :api_token => ENV['POSTMARK_API_TOKEN'] }
end
