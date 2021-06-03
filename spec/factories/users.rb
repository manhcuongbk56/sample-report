FactoryBot.define do
  factory :user, class: User do
    id { SecureRandom.uuid }
    username { Faker::Name.first_name }
    password { Faker::Internet.password }
    salt { 'salt' }
  end
end
