$LOAD_PATH.unshift File.dirname(__FILE__)
require 'app'

Mongoid.load!("#{File.dirname(__FILE__)}/mongoid.yml")

module BSON
  # Monkey path for ObjectId of a MongoDB document
  class ObjectId
    alias to_json to_s
    alias as_json to_s
  end
end

CartServiceApp.run!
