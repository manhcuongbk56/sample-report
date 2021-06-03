FactoryBot.define do
  factory :application do
    id { SecureRandom.uuid }
    key { 'appkey' }
    name { 'appName' }
  end
end
