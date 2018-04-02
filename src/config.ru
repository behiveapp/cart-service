$LOAD_PATH.unshift File.dirname(__FILE__)
require 'app'

@port = ENV['PORT'].strip.empty? ? 3000 : ENV['PORT']

configure do
  set :server, :puma
  set :run, true
  set :bind, '0.0.0.0'
  set :port, @port
end

Sinatra::Application.run!
