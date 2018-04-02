$LOAD_PATH.unshift File.dirname(__FILE__)
require 'app'

Mongoid.load!("#{File.dirname(__FILE__)}/mongoid.yml")

CartServiceApp.run!
