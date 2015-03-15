# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'descendants_loader/version'

Gem::Specification.new do |s|
  s.name        = 'descendants-loader'
  s.version     = DescendantsLoader::VERSION
  s.authors     = ['Daniel Silvestre']
  s.email       = ['djlebersilvestre@gmail.com']
  s.homepage    = 'http://github.com/djlebersilvestre/descendants-loader'
  s.summary     = 'An Object.descendants and Object.subclasses loader'
  s.description = 'The desired classes will have an autoload of its hierarchy'

  s.rubyforge_project = 'descendants-loader'

  s.files         = `git ls-files`.split('\n')
  s.test_files    = `git ls-files -- {spec}/*`.split('\n')
  s.executables   = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'simplecov-rcov'
  # s.add_development_dependency 'webmock'
  # s.add_development_dependency 'pry'
  # s.add_development_dependency 'vcr'
  # s.add_development_dependency 'fuubar'
  # s.add_development_dependency 'geminabox'
  # s.add_runtime_dependency 'activesupport'
  # s.add_runtime_dependency 'activemodel'
  # s.add_runtime_dependency 'rest-client'
  # s.add_runtime_dependency 'yajl-ruby'
  # s.add_runtime_dependency 'rest_model', ">= 0.2"
  # s.add_runtime_dependency 'locaweb-authentication-client', '~> 0.11.3'
end
