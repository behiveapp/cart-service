require 'rubygems'
require 'bundler'

Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)

require_relative '../../src/app.rb'

Mongoid.load!("#{File.dirname(__FILE__)}/../../src/mongoid.yml")

module RSpecMixin
  def app
    CartServiceApp
  end
end

RSpec.configure { |c| c.include RSpecMixin }
