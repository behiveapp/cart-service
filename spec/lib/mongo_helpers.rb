require './src/model/cart'

def initialize_carts
  Cart.create JSON.parse(
    '{
      "_id": {
          "$oid": "5ab072faf8245d0001e4e1c1"
      },
      "buyer": {
          "_id": {
              "$oid": "5aa75292f8245d00016bf8df"
          },
          "identifier": "14092959745",
          "name": "Edson Batista Ferreira Júnior"
      },
      "created_at": "2018-03-20T02:33:30.285+00:00",
      "seller": {
          "_id": {
              "$oid": "5aa75156f8245d00016bf8ab"
          },
          "full_name": "Império das Grifes",
          "identifier": "01001001000113",
          "short_name": null
      },
      "updated_at": "2018-03-20T02:33:30.285+00:00"
  }'
  )
end

def destroy_carts
  Cart.destroy_all
end