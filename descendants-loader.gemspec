# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'descendants_loader/version'

Gem::Specification.new do |s|
  s.name        = 'descendants-loader'
  s.version     = DescendantsLoader::VERSION
  s.license     = 'MIT'
  s.summary     = 'An Object.descendants and Object.subclasses loader'
  s.description = 'The desired classes will have an autoload of its hierarchy'
  s.author      = 'Daniel Silvestre'
  s.email       = 'djlebersilvestre@gmail.com'
  s.homepage    = 'http://github.com/djlebersilvestre/descendants-loader'

  s.files         = Dir['lib/**/*.rb'].select { |f| File.file?(f) }
  s.test_file     = Dir['spec/**/*.rb'].select { |f| File.file?(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'simplecov-rcov'
  s.add_runtime_dependency 'activesupport'
end
