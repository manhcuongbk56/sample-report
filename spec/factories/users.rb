require 'securerandom'
FactoryBot.define do
  factory :user do
    id { SecureRandom.uuid }
    username { "MyString" }
    password { "MyString" }
    salt { "MyString" }
  end
end
