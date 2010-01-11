class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  filter_parameter_logging :password

  private

  def dbug(msg,type=:info)
    request.env['firebug.logs'] = [[type.to_sym, msg]]
  end
end
