#!/usr/bin/env bash

set -o errexit

bundle install
yarn install
bin/rails assets:precompile
bin/rails assets:clean

bin/rails db:drop
bin/rails db:prepare
