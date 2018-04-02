# rubocop:disable MethodLength
def cart1
  JSON.parse(
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

def cart2
  JSON.parse(
    '{
      "_id": {
          "$oid": "5aa75292f8245d00016bf8df"
      },
      "buyer": {
          "_id": {
              "$oid": "5aa75292f8245d00016bf8df"
          },
          "identifier": "11604806729",
          "name": "Yasmin Affonso Pires Ferreira"
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

def product1
  JSON.parse(
    '{
      "_id": "5aa75156f8245d00016bf8ab",
      "code" : "PROD01",
      "name" : "Product 1",
      "seller_identifier" : "01001001000113"
      }'
  )
end
# rubocop:enable MethodLength
