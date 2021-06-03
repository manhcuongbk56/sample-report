FactoryBot.define do
  factory :installed_device do
    id {SecureRandom.uuid}
    device_id {SecureRandom.uuid}
  end
end
