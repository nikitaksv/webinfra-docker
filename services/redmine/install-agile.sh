#!/usr/bin/env bash
set -e
echo "---------------> Install agile"
rake redmine:plugins NAME=redmine_agile RAILS_ENV=production
