require "rubygems"
require "bundler"

Bundler.require(:default)                   # load all the default gems
Bundler.require(Sinatra::Base.environment)  # load all the environment specific gems

require_relative '../../src/app.rb'

module RSpecMixin
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }