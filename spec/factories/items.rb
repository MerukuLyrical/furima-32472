FactoryBot.define do
  factory :item do
    title               { Faker::Lorem.sentence }
    explaining          { Faker::Lorem.sentence }
    category_id         { '2' }
    status_id           { '2' }
    area_id             { '2' }
    delivary_fee_id     { '2' }
    need_day_id         { '2' }
    price               { '10000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
