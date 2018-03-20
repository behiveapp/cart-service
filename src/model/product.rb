require 'mongoid'

class Product
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  embedded_in :cart

  field :seller_identifier, type: String
  field :code, type: String
  field :name, type: String
end