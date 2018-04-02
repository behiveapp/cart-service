require 'spec_helper'
require './spec/lib/data_helpers'

describe 'AddProduct endpoint' do
  before do
    initialize_carts
    initialize_products
  end

  after do
    destroy_carts
    destroy_products
  end

  it 'should return status 200 if cart and product was found' do
    post '/5ab072faf8245d0001e4e1c1/product/5aa75156f8245d00016bf8ab'
    expect(last_response.status).to eq 200
  end

  it 'should return correct response if cart and product was found' do
    post '/5ab072faf8245d0001e4e1c1/product/5aa75156f8245d00016bf8ab'
    response_without_products = JSON.parse(last_response.body).reject do |k|
      k.eql? 'products'
    end
    expect(response_without_products).to eq cart1
  end

  it 'should return status 404 if cart was not found' do
    post '/foobar/product/5aa75156f8245d00016bf8ab'
    expect(last_response.status).to eq 404
  end

  it 'should return status 404 if product was not found' do
    post '/5ab072faf8245d0001e4e1c1/product/foobar'
    expect(last_response.status).to eq 404
  end
end
