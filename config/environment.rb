RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.frameworks -= [ :active_resource ]

  config.time_zone = 'Central Time (US & Canada)'

  config.action_controller.session_store = :active_record_store
end

ExceptionNotifier.exception_recipients  = %w(jerod+errors@rsdcompany.com)
