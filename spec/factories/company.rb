FactoryGirl.define do
  factory :company do
    name        { Faker::Company.name }
    contact     { Faker::Name.name }
  end
end