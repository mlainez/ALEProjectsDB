source 'http://rubygems.org'

gem 'pg',       :require => 'pg'
gem 'rails',    '3.0.7'
gem 'omniauth', :git => "git://github.com/intridea/omniauth.git"
gem 'texticle', :git => "git://github.com/dukz/texticle.git"
gem 'countries'
gem 'will_paginate'

group :test, :cucumber do
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem "rspec-rails", "~> 2.4"
  gem "webrat"
  gem 'factory_girl_rails'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-spork'
  gem 'launchy'
end

# Deploy with Capistrano
gem 'capistrano'

