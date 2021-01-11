FactoryBot.define do
  factory :buying do
    postal_code     { '111-1111' }
    area_id         { 2 }
    city            { '試験用' }
    address         { '試験3-2-3' }
    building        { 'コーポテスト3-3号室' }
    phone_number    { '09012345678' }
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end
