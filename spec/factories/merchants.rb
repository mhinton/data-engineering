require 'faker'

FactoryGirl.define do
  factory :merchant do
    name Faker::Name.name
    address Faker::Address.street_address
  end
end
