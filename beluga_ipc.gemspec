#require File.expand_path('lib/rhubarb/version', File.dirname(__FILE__))

Gem::Specification.new do |s|
  s.name = %q{beluga_ipc}
  #s.version = Rhubarb::Version::STRING
  s.version = '0.1.0'
  s.authors = ["Dan Swain"]
  s.date = Time.now.utc.strftime("%Y-%m-%d")
  s.email = %q{dan.t.swain@gmail.com}
  s.files = `git ls-files`.split("\n")
  s.homepage = %q{http://poincare.princeton.edu/gitweb/?p=BelugaIPC}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.8.11}
  s.summary = %q{IPC server for the Beluga project}
  s.test_files = `git ls-files spec examples`.split("\n")

  # eventually add this back in
  #s.add_dependency "rhubarb"

  # tests
  s.add_development_dependency 'rspec'
end