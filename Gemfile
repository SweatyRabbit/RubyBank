# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'devise', '~> 4.9', '>= 4.9.2'
gem 'draper', '~> 4.0', '>= 4.0.2'
gem 'i18n', '~> 1.14', '>= 1.14.1'
gem 'importmap-rails'
gem 'interactor', '~> 3.1', '>= 3.1.2'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '~> 6.4'
gem 'rails', '~> 7.1.1'
gem 'redis', '~> 4.0'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'bullet', '~> 7.1', '>= 7.1.2'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'fasterer', '~> 0.10.1'
  gem 'ffaker', '~> 2.23'
  gem 'lefthook', '~> 1.5', '>= 1.5.2'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rubocop-rails', '~> 2.21', '>= 2.21.2'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'rspec-rails', '~> 6.0', '>= 6.0.3'
  gem 'rubocop-rspec', '~> 2.24', '>= 2.24.1'
  gem 'shoulda-matchers', '~> 5.3'
  gem 'simplecov', '~> 0.22.0'
end
