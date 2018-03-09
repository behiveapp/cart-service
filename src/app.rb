$LOAD_PATH.unshift File.dirname(__FILE__)
require 'sinatra'
require 'router'

Mongoid.load!("#{File.dirname(__FILE__)}/mongoid.yml")
set :bind, '0.0.0.0'