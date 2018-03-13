$LOAD_PATH.unshift File.dirname(__FILE__)
require 'app'

@port = ENV['PORT'].blank? ? 3000 : ENV['PORT']

configure{
  set :server, :puma
  set :run, true
  set :bind, '0.0.0.0'
  set :port, @port
}


Sinatra::Application.run!