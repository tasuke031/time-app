FactoryBot.define do
  factory :room do
    name {Faker::Team.name}
    chosen_time {Faker::Number.within(range: 1..24)}
  end
end
