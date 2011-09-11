source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'jquery-rails'
gem 'haml-rails'
gem 'simple_form'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

group :development do
  gem 'rails3-generators' # for factory_girl_rails and simple_form
  gem 'nifty-generators', :git => 'git://github.com/PaBLoX-CL/nifty-generators.git' # rails 3.1 pull request 9/2/2011
  gem 'heroku'
end

group :test, :development do
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem "rspec-rails"
  gem 'rspec-instafail'
  gem 'rb-fsevent'
  gem 'growl'
  gem 'pry'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem "factory_girl_rails"
  gem "capybara"
  gem 'guard-spork'
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-migrate"
end

group :production do
  gem 'therubyracer-heroku' #, '0.8.1.pre3'
  gem 'pg'
end

