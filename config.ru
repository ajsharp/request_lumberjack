Bundler.require_env
require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'request_lumberjack'))

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/request_lumberjack.sqlite")
#DataMapper.auto_migrate!
use Rack::Static, :urls => ["/css", "/img", "/js"], :root => "public"

run RequestLumberjack.app

# vim:ft=ruby
