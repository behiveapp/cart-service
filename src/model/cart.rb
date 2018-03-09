require 'mongoid'

class Cart
  include Mongoid::Document
  # embeds_one :buyer
  # embeds_one :seller
  # embeds_many :products

  field :test, type: String
end