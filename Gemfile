source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.1'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '>= 1.1.0', require: false

##

gem 'seed_dump' #DB Migration populate test data
gem 'public_activity', '~> 1.6', '>= 1.6.2'
gem 'groupify', '~> 0.9.0'
gem 'mailgun-ruby', '~> 1.1', '>= 1.1.11'
gem 'devise', '~> 4.5'
gem 'acts_as_commentable', '~> 4.0', '>= 4.0.2'
gem 'acts_as_commentable_with_threading', '~> 2.0', '>= 2.0.1'
gem 'acts_as_votable' #Add voting to object
gem 'gmaps4rails',
       require: 'gmaps4rails',
       git:     'git://github.com/apneadiving/Google-Maps-for-Rails.git'

gem 'geocoder'  #Google api
# gem 'underscore-rails' #asset-pipeline # Rails 3.1 asset-pipeline gem. Not needed.

gem 'aws-sdk-v1', platforms: [:mingw, :mswin] #AWS SDK for older command support
gem 'aws-sdk', '~> 2', platforms: [:mingw, :mswin] #aws SDK New

#gem 'execjs', :platforms => :ruby #run JavaScript code from Ruby
#gem 'therubyracer', :platforms => :ruby #Java runtime live environment

gem 'passenger', :platforms => :ruby #Server
gem 'sinatra', :platforms => :ruby  #Rack web server interface
gem 'rack-parser', :platforms => :ruby #parse incoming post data into param hashes

# Gems added by Andrew for Bootstrap 4
gem 'bootstrap', '~> 4.1.3'
gem 'bootstrap_form', '~> 4.0'
gem 'sprockets-rails', '~> 3.2.1'
gem 'jquery-rails', '~> 4.3.3'


group :development, :test do
   gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
   gem 'rspec-rails', '~>3.8.1'
   gem 'fabrication'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0' 
  gem 'better_errors', '~> 2.5'
  gem 'binding_of_caller', '~> 0.8.0'
end

group :test do
  gem 'capybara', '~> 2.4.1'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'faker'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
