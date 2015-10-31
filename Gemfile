#added for openshift
#source 'http://mirror1.prod.rhcloud.com/mirror/ruby/'


source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
#gem 'bcrypt-ruby', '~> 3.0', :platform => 'ruby'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]

#authentication gem
gem 'devise'

#gem 'sqlserver' #Old ref

#Cant get this to work... Supposed to identify parent threads.
gem 'acts_as_commentable_with_threading'

#add comments to object
gem 'acts_as_commentable'


#For some reason requires download from external website.
gem 'gmaps4rails',
    require: 'gmaps4rails',
    git:     'git://github.com/apneadiving/Google-Maps-for-Rails.git'


gem 'underscore-rails' #asset-pipeline

gem 'geocoder'  #Google api



#gem 'mysql', :platform => 'ruby'


#gem 'mysql', :platforms => :ruby
gem 'mysql2'
#, platforms: [:mingw, :mswin]



#gem 'dinosaurus'
#gem 'passenger'

gem 'acts_as_votable' #Add voting to object

gem 'seed_dump' #DB Migration populate test data

gem 'aws-sdk-v1', platforms: [:mingw, :mswin] #AWS SDK for older command support
gem 'aws-sdk', '~> 2', platforms: [:mingw, :mswin] #aws SDK New
gem 'execjs', :platforms => :ruby #run JavaScript code from Ruby
gem 'therubyracer', :platforms => :ruby #Java runtime live environment
gem 'unicorn', '4.6.0', :platforms => :ruby #server request handler
gem 'passenger', :platforms => :ruby #Server
gem 'sinatra', :platforms => :ruby  #Rack web server interface
gem 'json', :platforms => :ruby #server environment parser
gem 'rack-parser', :platforms => :ruby #parse incoming post data into param hashes

gem 'capistrano', '~> 3.4.0' #remote server automation tool

#gem 'nokogiri', :platforms => :ruby
#use with original aws-sdk
#spec.add_dependency('aws-sdk', '< 2.0')

group :development, :test do
  gem 'rspec-rails', '3.3'
  gem 'fabrication', '2.11.3'
  gem 'pry'
  gem 'pry-nav'
end

group :test do
  gem 'capybara', '2.4.1'
  gem 'faker'
end
