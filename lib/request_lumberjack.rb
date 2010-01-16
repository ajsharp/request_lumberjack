$:.unshift(File.dirname(__FILE__))
Bundler.require_env

require "vendor/gems/environment"

require 'request_lumberjack/config'
require 'request_lumberjack/logged_response'

module RequestLumberjack

  def self.configure(db_uri)
    Config.database db_uri
  end

  class App
    def initialize(app, opts = {})
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)
      [status, headers, response]
    end
  end

end

