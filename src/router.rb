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
  CartService::Endpoints::GetCart.do_action(self, @body)
end

post '/' do
  CartService::Endpoints::OpenCart.do_action(self, @body)
end

post '/:id/product/:product_id' do
  CartService::Endpoints::AddProduct.do_action(self, @body)
end

delete '/:id/product/:product_id' do
  CartService::Endpoints::RemoveProduct.do_action(self, @body)
end
