require 'rubygems'
require 'bundler'

Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)

require_relative '../../src/app.rb'

module RSpecMixin
  def app
    Sinatra::Application
  end
end

RSpec.configure { |c| c.include RSpecMixin }
