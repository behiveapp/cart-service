require 'lib/middlewares/error_tracking'
require 'endpoints/open_cart'

use ErrorTracking

before do
  request.body.rewind
  @body = JSON.parse request.body.read
end

post '/open' do
  open_cart 
end