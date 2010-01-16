# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{request_lumberjack}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex Sharp"]
  s.date = %q{2010-01-16}
  s.description = %q{A simple request logger to be used with Rails and other Rack apps.}
  s.email = %q{ajsharp@gmail.com}
  s.executables = ["autospec", "autotest", "cucumber", "edit_json.rb", "htmldiff", "launchy", "ldiff", "multigem", "multiruby", "multiruby_setup", "nokogiri", "parse_tree_abc", "parse_tree_audit", "parse_tree_deps", "parse_tree_show", "prettify_json.rb", "rackup", "rake", "rcov", "shotgun", "spec", "tt", "unit_diff", "zentest"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "init.rb",
     "lib/request_lumberjack.rb",
     "lib/request_lumberjack/config.rb",
     "lib/request_lumberjack/logged_response.rb",
     "request_lumberjack.gemspec",
     "spec/app_spec.rb",
     "spec/config_spec.rb",
     "spec/logged_response_spec.rb",
     "spec/request_lumberjack_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/ajsharp/request_lumberjack}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A simple request logger to be used with Rails and other Rack apps.}
  s.test_files = [
    "spec/app_spec.rb",
     "spec/config_spec.rb",
     "spec/logged_response_spec.rb",
     "spec/request_lumberjack_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<actionpack>, ["= 2.3.5"])
      s.add_runtime_dependency(%q<do_sqlite3>, ["= 0.10.0"])
      s.add_runtime_dependency(%q<dm-core>, ["= 0.10.1"])
      s.add_runtime_dependency(%q<dm-validations>, ["= 0.10.1"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<actionpack>, ["= 2.3.5"])
      s.add_dependency(%q<do_sqlite3>, ["= 0.10.0"])
      s.add_dependency(%q<dm-core>, ["= 0.10.1"])
      s.add_dependency(%q<dm-validations>, ["= 0.10.1"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<actionpack>, ["= 2.3.5"])
    s.add_dependency(%q<do_sqlite3>, ["= 0.10.0"])
    s.add_dependency(%q<dm-core>, ["= 0.10.1"])
    s.add_dependency(%q<dm-validations>, ["= 0.10.1"])
  end
end

