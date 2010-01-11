ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require "webrat"

Webrat.configure do |config|
  config.mode = :rails
end

class ActiveSupport::TestCase

  # this provides methods: get_json, put_json, post_json, delete_json
  def method_missing(method, *args)
    if method.to_s =~ /^(get|put|post|delete)_json$/
      args.size == 1 ? args[1] = {:format => "json"} : args[1].merge(:format => "json")
      send($1, *args)
    else
      super
    end
  end

end
