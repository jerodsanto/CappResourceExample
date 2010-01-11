# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class Cappuccino
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/Frameworks\/Foundation|AppKit\/Foundation|AppKit.j/
      [200, {"Content-Type" => "text/html"}, []]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
end
