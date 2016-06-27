source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.10'
gem 'pg'                            #Db

gem 'bootstrap-sass'                #Bootstrap for responsive styling
gem 'bootswatch-rails'

# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'active_model_serializers', '~> 0.10.0'

gem 'devise'                        #Authentication
gem 'pundit'                        #Authorization
gem 'kaminari'                      #Pagination
gem 'delayed_job_active_record'     #Background job queueing

gem 'pnotify-rails'                 #JS notifications
gem 'unobtrusive_flash', '>=3'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'annotate'                    #Annotates model files with db schema
  gem 'meta_request'                #Used by rails panel
  gem 'daemons'                     #Used for running Delayed Jobs 
end

group :test do
  gem 'database_cleaner'            #Cleans the database inbetween tests
  gem 'capybara'                    #E2E test framework
  gem 'selenium-webdriver'          #Driver for Capybara
  gem 'simplecov'                   #Test coverage reporting
  gem 'rspec'                       #Test framework
  gem 'rspec-mocks'
  gem 'rspec-rails'
end

group :test, :development do
  gem "teaspoon-jasmine"            #Javascript unit tests
  gem 'mailcatcher'                 #Catches emails
  gem 'byebug'
  gem 'factory_girl'                #Creates factories for quickly generating model instances
  gem 'faker'                       #Generates fake data for testing
end
