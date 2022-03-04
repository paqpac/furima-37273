FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'あああ'}
    first_name            {'いいい'}
    kana_last_name        {'アアア'}
    kana_first_name       {'イイイ'}
    birthday              {Faker::Date.birthday}
  end
end