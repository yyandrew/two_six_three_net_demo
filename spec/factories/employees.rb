FactoryGirl.define do
  factory :employee do
    name { Faker::Name.name }
    role ['manager', 'staff'].sample
    age Random.rand(18..65)
    gender ['female', 'male'].sample
    phone { Faker::PhoneNumber.cell_phone }
    address { Faker::Address.street_address }
  end
end
