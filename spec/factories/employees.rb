FactoryGirl.define do
  factory :employee do
    name Faker::Name.name
    role Random.rand(0..1)
    age Random.rand(18..65)
    gender Random.rand(0..1)
    phone Faker::PhoneNumber.cell_phone
    address Faker::Address.street_address
  end
end
