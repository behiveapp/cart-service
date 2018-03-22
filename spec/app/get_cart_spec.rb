require "spec_helper"

describe "GetCart endpoint" do
  before do
    initialize_carts
  end

  after do
    destroy_carts
  end

  it "should return status 200 if cart was found" do
    get '/5ab072faf8245d0001e4e1c1'
    expect(last_response.status).to eq 200
  end
  
  it "should return status 404 if cart was not found" do
    get '/foobar'
    expect(last_response.status).to eq 404
  end
  
  it "should return status 200 if cart was found" do
    get '/5ab072faf8245d0001e4e1c1'
    expect(last_response.status).to eq 200
  end
end