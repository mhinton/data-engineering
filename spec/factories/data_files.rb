require 'faker'

FactoryGirl.define do
  factory :data_file do
    upload_file_name "example.tab"
    trait :good do
      upload { Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/fixtures/example_input.tab") }
    end

    trait :bad do
      upload { Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/fixtures/example_bad_input.tab") }
    end

    factory :good_data_file, traits: [:good]
    factory :bad_data_file, traits: [:bad]
  end
end
