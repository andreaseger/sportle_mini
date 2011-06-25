source 'http://rubygems.org'

gem 'rails', '3.1.0.rc4'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Database
gem 'hiredis'
gem 'redis', :require => ["redis/connection/hiredis", "redis"]
gem 'redis_storage', '>= 0.2.4'

# Views
gem 'haml-rails'
gem 'therubyracer'

# Asset template engines
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'


group :development do
  # Deploy with Capistrano
  gem 'capistrano'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'mocha'
  gem 'watchr'
  gem 'spork', '~> 0.9.0.rc'

  # irb stuff
  gem 'wirble'
  gem 'hirb'
  gem 'awesome_print'
  gem 'bond'
  gem 'sketches'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

