require_relative 'lib/middlewares/error_tracking'
require_relative 'endpoints/open_cart'
require_relative 'endpoints/get_cart'
require_relative 'endpoints/add_product'
require_relative 'endpoints/remove_product'

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