# frozen_string_literal: true

require 'capybara/rails'
require 'capybara/rspec'
require 'selenium-webdriver'

options = Selenium::WebDriver::Chrome::Options.new

Capybara.register_driver(:chrome) do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options:
  )
end

Capybara.configure do |config|
  config.default_driver = :chrome
  config.javascript_driver = :chrome
  config.default_max_wait_time = 10
end
