# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'descendants_loader/version'

Gem::Specification.new do |gem|
  gem.name        = 'descendants-loader'
  gem.version     = DescendantsLoader::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.authors     = ['Daniel Silvestre']
  gem.email       = ['djlebersilvestre@gmail.com']
  gem.homepage    = 'http://github.com/djlebersilvestre/descendants-loader'
  gem.description = %{
    This gem is an Object.descendants and Object.subclasses loader.
    The desired classes will have an autoload of its hierarchy.
    This aims a problem with lazy loading ruby classes (usually under
    development environment). For more information please check README.
  }
  gem.summary     = gem.description
  gem.license     = 'MIT'

  gem.required_ruby_version = '>= 2.0.0'

  gem.files         = Dir['lib/**/*.rb'].select { |f| File.file?(f) }
  gem.test_files    = Dir['spec/**/*.rb'].select { |f| File.file?(f) }
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'simplecov-rcov'
  gem.add_runtime_dependency 'activesupport'
end
