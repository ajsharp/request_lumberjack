$:.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'dm-core'
require 'dm-validations'

require 'request_lumberjack/config'
require 'request_lumberjack/logged_response'

module RequestLumberjack

  def self.configure(db_uri)
    Config.database db_uri
  end

  class App
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)
      Thread.new { LoggedResponse.create_from_response(response) }
      [status, headers, response]
    end
  end

end

