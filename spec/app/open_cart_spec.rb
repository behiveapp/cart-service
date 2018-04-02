require 'spec_helper'
require './spec/lib/data_helpers'

describe 'OpenCart endpoint' do
  before do
    Cart.create cart1
  end

  after do
    destroy_carts
  end

  it 'should return status 200 if cart was created' do
    post '/', cart2.to_json
    expect(last_response.status).to eq 200
  end

  it 'should return correct response if cart was created' do
    post '/', cart2.to_json
    expect(last_response.body).to eq cart2.to_json
  end
end
