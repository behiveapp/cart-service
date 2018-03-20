require 'lib/middlewares/error_tracking'
require 'endpoints/open_cart'
require 'endpoints/get_cart'
require 'endpoints/add_product'
require 'endpoints/remove_product'

use ErrorTracking

before do
  request.body.rewind
  payload = request.body.read
  @body = payload.blank? ? {} : JSON.parse(payload)
end

get '/:id' do
  get_cart 
end

post '/open' do
  open_cart 
end

put '/add/:id' do
  add_product
end

delete '/remove/:id' do
  remove_product
end