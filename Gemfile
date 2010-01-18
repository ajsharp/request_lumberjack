
gem 'bundler'
gem 'rack_hoptoad',        '>=0.0.4'
gem 'haml',                '~>2.2.0'
gem 'sinatra',             '0.9.4'
gem 'shotgun'

gem 'do_sqlite3',         '>=0.10.0'
gem 'dm-core',            '>=0.10.1'
gem 'dm-validations',     '>=0.10.1'
gem 'dm-timestamps',      '>=0.10.1'
gem 'dm-types',           '0.10.2'

only :test do
  gem 'rake'
  gem 'rspec',            '1.2.9',  :require_as => 'spec'
  gem 'rcov'
  gem 'autotest-growl'
  gem 'autotest-fsevent'
  gem 'webrat',           '~>0.5.0'
  gem 'rack-test',        '~>0.5.2', :require_as => 'rack/test'
  gem 'fakeweb',          '>=1.2.5'
end

only :production do
  gem 'thin'
end

disable_system_gems

# vim:ft=ruby
