source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'jquery-rails'
gem 'haml-rails'
gem 'simple_form'
gem 'decent_exposure'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
	gem 'compass', '>= 0.12.alpha.0'
  gem 'compass-html5', :git => 'git://github.com/sporkd/compass-html5.git'
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
  gem 'database_cleaner'
  gem 'capybara'
  gem 'capybara-webkit'
  
  gem 'factory_girl_rails'
  gem 'faker'
  
  gem 'guard-spork'
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-migrate"
  gem 'launchy' # provides save_and_open_page
  
  gem 'growl'
  gem 'pry'
end

group :production do
  gem 'therubyracer-heroku' #, '0.8.1.pre3'
  gem 'pg'
end

