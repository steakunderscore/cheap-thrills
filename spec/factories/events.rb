FactoryGirl.define do
  factory :event do
    association :venue

    starts_at { Faker::Date.forward(60) }
    price_cent { rand(1000..5000) }
    soldout false

    trait :soldout do
      soldout true
    end
  end
end
