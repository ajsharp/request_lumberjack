$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'request_lumberjack'
require 'spec'
require 'spec/autorun'


Spec::Runner.configure do |config|

  config.before(:all) do
    RequestLumberjack::Config.database "sqlite3://#{Dir.pwd}/request_lumberjack_test.sqlite3"
    DataMapper.auto_migrate!
  end
  
end
