FactoryGirl.define do
  factory :department do
    name Faker::Commerce.department
    description Faker::Lorem.sentence(3)
    #association :employees, factory: :employee
  end

end
