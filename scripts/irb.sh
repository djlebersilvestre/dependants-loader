#!/bin/bash

set -e
cd "$(dirname "$0")"

bundle exec irb -r '../lib/descendants_loader.rb'
