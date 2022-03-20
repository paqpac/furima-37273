FactoryBot.define do
  factory :purchase_address do
    postal_code {"062-0931"}
    prefecture_id {2}
    city {"札幌市"}
    block_number {"豊平区平岸一条一丁目"} 
    building_name { }
    phone_number {"01234567890"}
    item_id {1}
    user_id {1}
  end
end
