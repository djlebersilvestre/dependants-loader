require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rake/rdoctask'

include Rake::DSL

Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new(:spec)
task default: :spec

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
