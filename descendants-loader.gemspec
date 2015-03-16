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

  gem.files         = Dir['lib/**/*.rb'].select { |f| File.file?(f) }
  gem.test_files    = Dir['spec/**/*.rb'].select { |f| File.file?(f) }
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 1.9.3'
  gem.add_development_dependency 'rake', '>= 10.0'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'simplecov', '~> 0.7'
  gem.add_development_dependency 'simplecov-rcov', '~> 0.2'
  gem.add_runtime_dependency 'activesupport', '>= 3.2'
end
