FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
    last_name               { '試験' }
    first_name              { '試験' }
    last_name_kana         { 'テスト' }
    first_name_kana        { 'テスト' }
    birthday { '1930-01-01' }
  end
end
