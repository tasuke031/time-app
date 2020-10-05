FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    avatar {Faker::Lorem.sentence}
    association :user
    association :room
  end
end