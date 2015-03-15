#!/bin/bash

set -e
cd "$(dirname "$0")/.."

echo 'Installing dependency for overcommit'
sudo apt-get install -y shellcheck

echo 'Using RVM (loading from .bash_profile)'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm use 2.2.1@descendants-loader --create

echo 'Vendorizing gems'
bundle install --path vendor/bundle

echo 'Adding base gems to gemset'
gem install rubocop
gem install overcommit
gem install rubycritic

echo 'Configuring overcommit (to apply git hooks - quality threshold)'
overcommit --install
overcommit --sign pre-commit
mv .git/hooks/post-checkout .git/hooks/post-checkout.sample

echo 'Running specs for the first time  ;)'
bundle exec rspec
