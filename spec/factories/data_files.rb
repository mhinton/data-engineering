require 'faker'

FactoryGirl.define do
  factory :data_file do
    upload { Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/fixtures/example_input.tab") }
    uploaded_at { DateTime.now }
  end
end
