FactoryBot.define do
  factory :item do
    name          {Faker::Lorem.words}
    introduction  {Faker::Lorem.sentence}
    category_id   { 2 }
    item_status_id   { 2 }
    shipping_cost_id { 2 }
    prefecture    { Prefecture.all.sample }
    delivery_time_id {2}#{ DeliveryTime.all.sample }
    price         {Faker::Number.between(from: 300, to: 9999999)}
    
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test0.png'),filename: 'test0.png')
    end
  end
end
