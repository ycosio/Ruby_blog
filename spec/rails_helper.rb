# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'factory_girl_rails'
require 'support/factory_girl'
require 'spec_helper'
require 'rspec/rails'
require 'shoulda-matchers'
require 'devise'
require 'capybara/rails'
require 'capybara/rspec'
require 'database_cleaner'
require 'helpers/session'

ActiveRecord::Migration.maintain_test_schema!


Shoulda::Matchers.configure do |config|
    config.integrate do |with|
     #choose a test framework:
      with.test_framework :rspec
      #with.test_framework :minitest
      #with.test_framework :minitest_4
      #with.test_framework :test_unit

      # choose one or more libraries:
      with.library :active_record
      with.library :active_model
      with.library :action_controller
      # or, choose the following (which implies all of the above)
    end
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include Session

  #config.before(:suite) do
    #DatabaseCleaner.strategy = :transaction
    #DatabaseCleaner.clean_with(:truncation)
  #end

  #config.around(:each) do |example|
    #DatabaseCleaner.cleaning do
      #example.run
    #end
  #end

  [:controller, :view, :request].each do |type|
    config.include ::Rails::Controller::Testing::TestProcess, :type => type
    config.include ::Rails::Controller::Testing::TemplateAssertions, :type => type
    config.include ::Rails::Controller::Testing::Integration, :type => type
  end

  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

