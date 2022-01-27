source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'


# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'devise-bootstrap-views', '~> 1.1'
gem 'recaptcha', git: "https://github.com/ambethia/recaptcha.git"
# Time validator
gem 'validates_timeliness', '~> 4.1', '>= 4.1.1'
# AWS s3
gem "aws-sdk-s3", require: false


# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'
gem 'devise', '~> 4.7', '>= 4.7.1'
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'
gem 'simple_form', '~> 4.1'
# gem 'date_wrapper', '~> 0.1.3'
# gem 'webpacker', '~> 0.1'
# gem 'webpacker', '~> 4.0', '>= 4.0.7'
#Use for MetaSearch
gem 'ransack', '~> 2.3'
gem 'rails-i18n', '~> 5.1', '>= 5.1.3'
gem 'railties', '~> 5.2', '>= 5.2.3'
gem 'faker', '~> 2.4'
gem 'dotenv-rails', '~> 2.7', '>= 2.7.5'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pundit', '~> 2.1'
gem 'pg', '~> 1.1', '>= 1.1.4'
gem 'aasm', '~> 5.0', '>= 5.0.6'
gem 'friendly_id', '~> 5.3'
gem 'paranoia', '~> 2.4', '>= 2.4.2'
gem 'sidekiq', '~> 6.4'
gem 'factory_bot_rails', '~> 5.1'
# gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.5'
# gem 'momentjs-rails', '~> 2.20', '>= 2.20.1'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap-datetimepicker-3'
end


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'hirb-unicode'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
