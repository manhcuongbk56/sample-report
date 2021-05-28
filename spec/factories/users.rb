require 'securerandom'
FactoryBot.define do
  factory :user do
    id { SecureRandom.uuid }
    username { "MyString" }
    password { "MyString" }
    salt { "MyString" }
    created_at {Time.now}
  end
  factory :user_random, class: User do
    id { SecureRandom.uuid }
    username { Faker::Name.first_name }
    password { Faker::Internet.password }
    salt { Faker::Name.last_name }
    created_at {Time.now}
  end
end
