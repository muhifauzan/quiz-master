#!/bin/sh

set -e

bundle check || bundle install

rails server -p 3000 -b '0.0.0.0'
