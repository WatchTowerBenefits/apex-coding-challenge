source "https://rubygems.org"

ruby "3.3.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1"

# Use sqlite3 as the database for Active Record
gem "sqlite3", ">= 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Architectural and runtime dependencies aligned with the interview plan stack
gem "classy_hash"
gem "fx", require: false
gem "oj"
gem "pundit"
gem "scenic", require: false
gem "sidekiq"
gem "rails_event_store", "~> 2.18.0"
gem "packs"
gem "packs-rails"
gem "packs-specification"
gem "packwerk", "~> 3.2.3"
gem "packwerk-extensions"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]

  # Modular architecture and testing stack
  gem "database_cleaner-active_record"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "ruby_event_store-rspec"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # N+1 query detection in development
  gem "bullet"
end

