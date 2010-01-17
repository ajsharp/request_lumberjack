Bundler.require_env(:test)

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rack/test'
require 'request_lumberjack'
require 'action_controller'

Webrat.configure do |config|
  config.mode = :rack
  config.application_port = 4567
end

Spec::Runner.configure do |config|
  config.include(Rack::Test::Methods)
  config.before(:all) do
    RequestLumberjack::Config.database "sqlite3://#{Dir.pwd}/request_lumberjack_test.sqlite3"
    DataMapper.auto_migrate!
  end

  def mock_env(opts = {})
    { 'REQUEST_METHOD' => 'GET', 'REQUEST_URI' => 'http://example.com/controller/action' }.merge(opts)
  end

  def mock_rails_response(opts = {})
    request  = ActionController::Request.new mock_env(opts)
    response = ActionController::Response.new
    response.request = request
    response
  end

  def mock_rack_response
    Rack::Response.new
  end

  def app
    RequestLumberjack.app
  end

  def response
    last_response
  end
  
end
