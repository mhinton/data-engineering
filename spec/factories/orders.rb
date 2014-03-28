require 'faker'

FactoryGirl.define do
  factory :order do
    association :item
    association :customer
    quantity { Faker::Number.digit.to_i + 1 }
  end
end
