require 'sinatra/base'
require_relative 'lib/middlewares/error_tracking'
require_relative 'router'

# Class representing the whole application
class CartServiceApp < Sinatra::Base
  use ErrorTracking
  register CartService::Endpoints::GetCart
  register CartService::Endpoints::OpenCart
  register CartService::Endpoints::AddProduct
  register CartService::Endpoints::RemoveProduct

  before do
    request.body.rewind
    payload = request.body.read
    @body = payload.blank? ? {} : JSON.parse(payload)
  end

  configure do
    set :server, :puma
    set :run, true
    set :bind, '0.0.0.0'
    set :port, (ENV['PORT'].strip.empty? ? 3000 : ENV['PORT'])
  end
end
