# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'
gem 'rails', '~> 7.1.1'

gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.3', '>= 5.3.2'
gem 'devise', '~> 4.9', '>= 4.9.2'
gem 'factory_bot_rails', '~> 6.2'
gem 'ffaker', '~> 2.23'
gem 'i18n', '~> 1.14', '>= 1.14.1'
gem 'importmap-rails', '~> 1.2', '>= 1.2.1'
gem 'interactor', '~> 3.1', '>= 3.1.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 6.4'
gem 'sass-rails', '~> 6.0'
gem 'sprockets-rails', '~> 3.4', '>= 3.4.2'
gem 'stimulus-rails', '~> 1.3'
gem 'turbo-rails', '~> 1.5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'bullet', '~> 7.1', '>= 7.1.2'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
  gem 'fasterer', '~> 0.10.1'
  gem 'lefthook', '~> 1.5', '>= 1.5.2'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rubocop-rails', '~> 2.21', '>= 2.21.2'
  gem 'rubocop-rspec', '~> 2.24', '>= 2.24.1'
end

group :development do
  gem 'web-console', '~> 4.2', '>= 4.2.1'
end

group :test do
  gem 'capybara', '~> 3.39', '>= 3.39.2'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.3'
  gem 'selenium-webdriver', '~> 4.14'
  gem 'shoulda-matchers', '~> 5.3'
  gem 'simplecov', '~> 0.22.0'
end
