$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
require 'request_lumberjack'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  def get_rails_response(opts = {})
    env = { 'REQUEST_METHOD' => 'GET', 'REQUEST_URI' => 'http://example.com/controller/action' }.merge(opts)
    request  = ActionController::Request.new env
    response = ActionController::Response.new
    response.request = request
    response
  end

  config.before(:all) do
    RequestLumberjack::Config.database "sqlite3://#{Dir.pwd}/request_lumberjack_test.sqlite3"
    DataMapper.auto_migrate!
  end
  
end
