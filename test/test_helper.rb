ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"  # for Colorized output
#  For colorful output!
require 'edamam_api_wrapper'

#for tests
require 'vcr'
require 'webmock/minitest'

require 'vcr'
require 'webmock/minitest'

VCR.configure do |config|
  config.cassette_library_dir = 'test/cassettes' # folder where casettes will be located
  config.hook_into :webmock # tie into this other tool called webmock
  config.default_cassette_options = {
    :record => :new_episodes,    # record new data when we don't have it yet
    :match_requests_on => [:method, :uri, :body] # The http method, URI and body of a request all need to match
  }
  # Don't leave our token lying around in a cassette file.
   config.filter_sensitive_data("<EDAMAM_APP_ID>") do
     ENV['EDAMAM_APP_ID']
   end
   config.filter_sensitive_data("<EDAMAM_APP_KEY>") do
     ENV['EDAMAM_APP_KEY']
   end
end

#configure VCR for tests
# VCR.configure do |config|
#   config.cassette_library_dir = 'test/cassettes' # folder where casettes will be located
#   config.hook_into :webmock # tie into this other tool called webmock
#   config.default_cassette_options = {
#     :record => :new_episodes,    # record new data when we don't have it yet
#     :match_requests_on => [:method, :uri, :body] # The http method, URI and body of a request all need to match
#   }
#   # Don't leave our Slack token lying around in a cassette file.
#   config.filter_sensitive_data("<SLACK_TOKEN>") do
#     ENV['SLACK_TOKEN']
#   end
# end

Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)


# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end
