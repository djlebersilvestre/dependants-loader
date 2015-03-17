#!/bin/bash

set -e
cd "$(dirname "$0")/.."

echo 'Loading RVM - it must be installed as user mode'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm use 2.2.1@descendants-loader --create

echo 'Vendorizing gems'
bundle install --path vendor/bundle

echo 'Adding base gems to gemset'
gem install travis
gem install rubocop
gem install rubycritic
gem install overcommit

echo 'Configuring overcommit (to apply git hooks - quality threshold)'
overcommit --install
overcommit --sign pre-commit
mv .git/hooks/post-checkout .git/hooks/post-checkout.sample

echo 'Finally, testing for the first time'
bundle exec rspec

echo 'Running everything attached to overcommit (specs too)  ;)'
overcommit -r
