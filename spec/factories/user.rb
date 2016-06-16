FactoryGirl.define do
  factory :basic_user, :class => 'User' do
    name                      { Faker::Name.name }
    email                     { Faker::Internet.email }
    password                  { Faker::Internet.password }
    confirmed_at              { Time.now }

    factory :user do
      role                    1
    end

    factory :admin do
      role                    2
    end

    trait :french do
      locale                  "fr"
    end
  end
end