require 'faker'
require 'bigdecimal'

FactoryGirl.define do
  factory :item do
    association :merchant
    description { Faker::Commerce.product_name }
    price { BigDecimal.new("#{Faker::Number.number(2)}.#{Faker::Number.number(2)}") }
  end
end
