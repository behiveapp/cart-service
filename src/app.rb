require 'sinatra'
require 'sinatra/reloader' if development?
require 'router'

Mongoid.load!("#{File.dirname(__FILE__)}/mongoid.yml")

also_reload 'src/endpoints/*'
also_reload 'src/model/*'
also_reload 'src/lib/errors/*'
also_reload 'src/lib/middlewares/*'

after_reload do
  puts 'App reloaded'
end