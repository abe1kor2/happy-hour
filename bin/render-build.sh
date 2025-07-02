#!/usr/bin/env bash

set -o errexit

bundle install
yarn install
bin/rails assets:precompile
bin/rails assets:clean

bin/rails db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1
bin/rails db:prepare
