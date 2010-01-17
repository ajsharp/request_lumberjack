require 'sinatra/base'
require 'haml/util'
require 'haml/engine'

$:.unshift(File.dirname(__FILE__))

require 'request_lumberjack/config'
require 'request_lumberjack/logged_response'
require 'request_lumberjack/app'

module RequestLumberjack

  def self.configure(db_uri)
    Config.database db_uri
  end

  def self.app
    @app ||= Rack::Builder.new do
      # use Rack::HoptoadNotifier 'mysecretkey' 
      # use Rack::Session::Cookie, :key => 'rack.session', :path => '/',
      #  :expire_after => 2592000, :secret => '127edea6d9bbe0568a9882462bc47432fb4692b0'
      run RequestLumberjack::App
    end
  end

end

