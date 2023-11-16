source 'https://rubygems.org'

ruby '2.6.6'
gem 'rails', '5.2.1'
gem "image_processing", ">= 1.2"
gem "google-cloud-storage" #, "~> 1.11", require: false
gem 'date_validator', '~> 0.10.0'
gem 'devise'

# for Heroku deployment 
group :development, :test do
  gem 'sqlite3', '1.3.11'
  gem 'byebug'
  gem 'database_cleaner', '1.4.1'
  gem 'date_validator', '~> 0.10.0'
  gem 'capybara', '2.17'
  gem 'launchy'
  gem 'rspec-rails', '3.7.2'
  gem 'ZenTest', '4.11.2'
  gem 'bundler', '~> 1.17'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'cucumber-rails-training-wheels'
  gem 'simplecov', :require => false
end
group :production do
  gem 'pg', '~> 0.21'
end

# Gems used only for assets and not required
# in production environments by default.

gem 'sass-rails', '~> 5.0.3'
gem 'uglifier', '>= 2.7.1'
gem 'jquery-rails'
