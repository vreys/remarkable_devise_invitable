require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
require './lib/remarkable/devise/invitable/version.rb'
Jeweler::Tasks.new do |gem|
  gem.name = "remarkable_devise_invitable"
  gem.homepage = "http://github.com/vreys/remarkable_devise_invitable"
  gem.license = "MIT"
  gem.summary = %Q{Remarkable RSpec matchers for devise_invitable models}
  gem.description = %Q{Remarkable RSpec matchers for devise_invitable models. It should be used with remarkable_devise.}
  gem.email = "reys.vasily@gmail.com"
  gem.authors = ["Vasily Reys"]
  gem.version = Remarkable::Devise::Invitable::Version::STRING

  gem.files      = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- spec/*`.split("\n")

  gem.add_runtime_dependecy 'rspec', '~> 2.1.0'
  gem.add_runtime_dependecy 'actionpack', '~> 3.0.0'
  gem.add_runtime_dependecy 'activerecord', '~> 3.0.0'
  gem.add_runtime_dependecy 'devise_invitable', '~> 0.3.5'
  gem.add_runtime_dependecy 'remarkable_devise', '~> 1.0.0'

  gem.add_development_dependency 'mocha', ">= 0"
  gem.add_development_dependency 'rspec', "~> 2.1.0"
  gem.add_development_dependency 'bundler', "~> 1.0.0"
  gem.add_development_dependency 'jeweler', "~> 1.5.1"
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = Remarkable::Devise::Invitable::Version::STRING

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "remarkable_devise_invitable #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
