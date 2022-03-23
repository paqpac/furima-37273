FactoryBot.define do
  factory :purchase_address do
    postal_code {"062-0931"}
    prefecture_id {2}
    city {"札幌市"}
    block_number {"豊平区平岸一条一丁目"} 
    building_name {"ライオンズマンション" }
    phone_number {"01234567890"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
