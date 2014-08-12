ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/poltergeist'
require 'capybara/email/rspec'
require 'aws'

Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  # Capybara::Poltergeist::Driver.new(app, debug: false)
  Capybara::Poltergeist::Driver.new(app, {debug: false, js_errors: false, phantomjs_options: ['--load-images=no']})
end

Capybara.server do |app, port|
  require 'rack/handler/thin'
  Rack::Handler::Thin.run(app, Port: port)
end

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

AWS.stub!
AWS.config(access_key_id: Rails.application.secrets.AWS_access_key, secret_access_key: Rails.application.secrets.AWS_secret_key)


RSpec.configure do |config|

  config.include Warden::Test::Helpers
  Warden.test_mode!

  config.after(:each) do
    Warden.test_reset!
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.infer_spec_type_from_file_location!
end
