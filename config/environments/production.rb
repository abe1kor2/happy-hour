require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot for better performance and memory savings (ignored by Rake tasks).
  config.eager_load = true

  # Full error reports are disabled.
  config.consider_all_requests_local = false

  # Turn on fragment caching in view templates.
  config.action_controller.perform_caching = true

  # Cache assets for far-future expiry since they are all digest stamped.
  config.public_file_server.headers = { "cache-control" => "public, max-age=#{1.year.to_i}" }

  # Enable serving of static files from the public folder. Render needs this.
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present? || true

  # Store uploaded files on the local file system. This is suitable for Render's free tier,
  # but be aware that the file system is ephemeral and files will be lost on deploys.
  # For persistent storage, configure a cloud service like S3, GCS, or Azure.
  config.active_storage.service = :local

  # Assume all access to the app is happening through a SSL-terminating reverse proxy.
  config.assume_ssl = true

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = true

  # Log to STDOUT with the current request id as a default log tag.
  config.log_tags = [ :request_id ]
  config.logger   = ActiveSupport::TaggedLogging.logger(STDOUT)

  # Change to "debug" to log everything (including potentially personally-identifiable information!)
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # Prevent health checks from clogging up the logs.
  config.silence_healthcheck_path = "/up"

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Replace the default in-process memory cache store with a durable alternative.
  config.cache_store = :solid_cache_store
  # Configure Solid Cache to use the primary database connection.
  config.solid_cache.connects_to = { database: { writing: :primary, reading: :primary } }

  # Replace the default in-process and non-durable queuing backend for Active Job.
  config.active_job.queue_adapter = :solid_queue
  # Configure Solid Queue to use the primary database connection.
  config.solid_queue.connects_to = { database: { writing: :primary, reading: :primary } }

  # Set host to be used by links generated in mailer templates.
  # Remember to set this to your actual Render URL in your environment variables.
  config.action_mailer.default_url_options = { host: ENV.fetch("RAILS_HOST") { "happyhournl.onrender.com" } }

  # Enable locale fallbacks for I18n.
  config.i18n.fallbacks = true

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Only use :id for inspections in production.
  config.active_record.attributes_for_inspect = [ :id ]
  
  # Allow your Render domain.
  config.hosts << ENV.fetch("RAILS_HOST") { "happyhournl.onrender.com" } if ENV["RAILS_HOST"].present?
end
