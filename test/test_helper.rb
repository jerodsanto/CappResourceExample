ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require "webrat"

Webrat.configure do |config|
  config.mode = :rails
end

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
end
