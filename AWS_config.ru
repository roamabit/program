# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

require 'rack'
require 'rack/parser'
require 'json'
require './worker_sample'
run WorkerSample
