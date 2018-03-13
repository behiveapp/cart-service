require 'mongoid'

class Seller
  include Mongoid::Document

  field :identifier, type: String
  field :full_name, type: String
  field :short_name, type: String
end