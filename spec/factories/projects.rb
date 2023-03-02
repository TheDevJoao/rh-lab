FactoryBot.define do
  factory :project do
    name { FFaker::Company.bs }
    starts_on  { FFaker::Time.between(Time.zone.yesterday, Time.zone.yesterday - 1.year).to_date }
    ends_on { FFaker::Time.between(Time.zone.today, Time.zone.today + 4.years).to_date }
    budget { rand(100_000..150_000) }
    spent { rand(0..200_000) }
  end
end
