Bundler.require_env
require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'request_lumberjack'))

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/request_lumberjack.sqlite")
DataMapper.auto_upgrade!

RequestLumberjack::App.set :environment, ENV["RACK_ENV"] || :production

run RequestLumberjack.app

# vim:ft=ruby
