require 'simplecov-rcov'
require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start do
  `git checkout origin/master coverage/.last_run.json`

  minimum_coverage(95)
  maximum_coverage_drop(2)

  add_filter 'spec/'
  add_filter 'vendor/'
end

require File.expand_path('../../lib/descendants_loader.rb', __FILE__)

RSpec.configure do |config|
  # Run specs in random order to surface order dependencies
  config.order = :random
end
