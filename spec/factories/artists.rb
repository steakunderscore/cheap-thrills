FactoryGirl.define do
  factory :artist do
    name { Faker::Commerce.product_name }
  end
end
