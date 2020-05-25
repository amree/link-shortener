source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 6.0.3"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 4.3"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false
# Authentication
gem "devise"
# Forms
gem "simple_form"
# URL Validator
gem "validate_url"
# Decorator
gem "active_decorator"
# Analytics
gem "ahoy_matey"
# Geolocation for analytics
gem "maxminddb"
# Background job
gem "sidekiq"
# tomo plugin for sidekiq
gem "tomo-plugin-sidekiq"
# Interacting with redis
gem "redis"
# Faster redis connection library
gem "hiredis"

group :development, :test do
  # Testing fixtures
  gem "factory_bot_rails"
  # Generate random data for testing
  gem "faker"
  # For debugging
  gem "pry-byebug"
  gem "pry-rails"
  # For general testings
  gem "rspec-rails"
  # For code linting
  gem "standard"
  # Deployment
  gem "tomo"
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  # Run hooks before commit
  gem "overcommit"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  # Speed up rspec command
  gem "spring-commands-rspec"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara"
  gem "capybara-screenshot"
  gem "selenium-webdriver"
  # For testing models
  gem "shoulda-matchers"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
end
